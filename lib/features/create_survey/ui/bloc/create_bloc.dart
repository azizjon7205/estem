import 'package:estem/features/survey/ui/response/bloc/survey_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/repositories/survey_repository.dart';
import '/core/utils/log/app_logger.dart';
import '/shared/models/upload_file_params.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/repositories/categories_repository.dart';
import '../../domain/repositories/regions_repository.dart';
import '../../domain/repositories/upload_image_repository.dart';
import 'create_event.dart';
import 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final CategoriesRepository _categoriesRepository;
  final RegionsRepository _regionsRepository;
  final UploadImageRepository _imageRepository;
  final SurveyRepository _surveyRepository;

  final uuid = const Uuid();

  final ScrollController scrollController = ScrollController();

  CreateBloc({
    required CategoriesRepository categoriesRepository,
    required RegionsRepository regionsRepository,
    required UploadImageRepository imageRepository,
    required SurveyRepository surveyRepository,
  })  : _categoriesRepository = categoriesRepository,
        _regionsRepository = regionsRepository,
        _imageRepository = imageRepository,
        _surveyRepository = surveyRepository,
        super(CreateState(image: 'https://picsum.photos/200/300')) {
    on<OnTapBrowseImage>(_onTapBrowseImage);
    on<OnQuestionRequiredChanged>(_onQuestionRequiredChanged);
    on<OnAddQuestion>(_onAddQuestion);
    on<OnTempQuestionChanged>(_onTempQuestionChanged);
    on<OnAddTempQuestion>(_onAddTempQuestion);
    on<OnQuestionChanged>(_onQuestionChanged);
    on<OnDuplicateQuestion>(_onDuplicateQuestion);
    on<OnDeleteQuestion>(_onDeleteQuestion);
    on<OnTitleChanged>(_onTitleChanged);
    on<OnDescriptionChanged>(_onDescriptionChanged);
    on<OnDurationChanged>(_onDurationChanged);
    on<OnPriceChanged>(_onPriceChanged);
    on<OnPageChanged>(_onPageChanged);
    on<OnLoadCategories>(_onLoadCategories);
    on<OnLoadRegions>(_onLoadRegions);
    on<OnSelectRegion>(_onSelectRegion);
    on<OnSelectCategory>(_onSelectCategory);
    on<OnDeleteImage>(_onDeleteImage);
    on<OnSubmitSurvey>(_onSubmitSurvey);
    on<OnSaveToDraft>(_onSaveToDraft);
    on<OnLoadSurveyToEdit>(_onLoadSurveyToEdit);
  }

  void _onLoadCategories(
      OnLoadCategories event, Emitter<CreateState> emit) async {
    try {
      final response = await _categoriesRepository.getCategories();
      emit(state.copyWith(categories: response));
    } catch (e) {
      logger.info("Categories load error: $e");
    }
  }

  void _onSelectCategory(OnSelectCategory event, Emitter<CreateState> emit) {
    emit(state.copyWith(categoryId: event.id));
  }

  void _onLoadRegions(OnLoadRegions event, Emitter<CreateState> emit) async {
    try {
      final response = await _regionsRepository.getRegions();
      emit(state.copyWith(regions: response));
      logger.info("Regions load res: $response");
    } catch (e) {
      logger.info("Regions load error: $e");
    }
  }

  void _onSelectRegion(OnSelectRegion event, Emitter<CreateState> emit) {
    emit(state.copyWith(regionId: event.id));
  }

  void _onTapBrowseImage(
      OnTapBrowseImage event, Emitter<CreateState> emit) async {
    emit(state.copyWith(imageLoading: true));
    try {
      final image =
          await _imageRepository.uploadImage(UploadFileParams(type: 'survey'));
      print('ImageUploadImage: $image');
      if (state.tempImageId != null) {
        _imageRepository.deleteImage(state.tempImageId);
      }
      emit(state.copyWith(
          image: image.url, imageLoading: false, tempImageId: image.id));
    } catch (e) {
      emit(state.copyWith(imageLoading: false));
      logger.info("Image upload error: $e");
    }
  }

  void _onDeleteImage(OnDeleteImage event, Emitter<CreateState> emit) {
    if (state.tempImageId != null) {
      _imageRepository.deleteImage(state.tempImageId);
    }
  }

  void _onTitleChanged(OnTitleChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChanged(
      OnDescriptionChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onDurationChanged(OnDurationChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(duration: event.duration));
  }

  void _onPriceChanged(OnPriceChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(price: event.price));
  }

  void _onPageChanged(OnPageChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onAddQuestion(OnAddQuestion event, Emitter<CreateState> emit) {
    final List<QuestionEntity> questions = [];
    questions.addAll(state.questions);
    questions.add(event.questionEntity);
    emit(state.copyWith(questions: questions, tempQuestion: null));
  }

  void _onAddTempQuestion(OnAddTempQuestion event, Emitter<CreateState> emit) {
    final questionEntity =
        QuestionEntity(id: uuid.v4(), question: event.question);
    emit(state.copyWith(tempQuestion: questionEntity));
  }

  void _onTempQuestionChanged(
      OnTempQuestionChanged event, Emitter<CreateState> emit) {
    emit(state.copyWith(tempQuestion: event.entity));
  }

  void _onQuestionChanged(OnQuestionChanged event, Emitter<CreateState> emit) {
    final index = state.questions.indexWhere(
        (element) => element.id == event.question.id); // wrong this way
    if (index >= 0) {
      final List<QuestionEntity> questions = [];
      questions.addAll(state.questions);

      questions[index] = event.question;

      emit(state.copyWith(questions: questions));
    }
  }

  void _onDuplicateQuestion(
      OnDuplicateQuestion event, Emitter<CreateState> emit) {
    final questions = state.questions;
    final question = questions
        .firstWhere((element) => element.id == event.id)
        .copyWith(id: uuid.v4());
    questions.add(question);
    emit(state.copyWith(questions: questions, tempQuestion: question));
  }

  void _onDeleteQuestion(OnDeleteQuestion event, Emitter<CreateState> emit) {
    final questions = state.questions;
    final index = questions.indexWhere((element) => element.id == event.id);
    if (index != -1) {
      questions.removeAt(index);
    }
    emit(state.copyWith(questions: questions));
  }

  void _onQuestionRequiredChanged(
      OnQuestionRequiredChanged event, Emitter<CreateState> emit) {
    final index =
        state.questions.indexWhere((element) => element.id == event.id);
    final question = state.questions[index].question;
    final questions = state.questions;

    questions[index].question = question.copyWith(isRequired: event.required);

    emit(state.copyWith(questions: questions));
  }

  void _onSubmitSurvey(OnSubmitSurvey event, Emitter<CreateState> emit) {
    if (state.isReadyToCreate) {
      try {
        final response =
            _surveyRepository.submitSurveyQuestions(state.mapToSurveyParams());
        logger.info("OnSubmit survey response: $response");
      } catch (e) {
        logger.info("OnSubmit survey error: $e");
      }
    }
  }

  void _onSaveToDraft(OnSaveToDraft event, Emitter<CreateState> emit) {}

  void _onLoadSurveyToEdit(
      OnLoadSurveyToEdit event, Emitter<CreateState> emit) async {
    if (event.id != null) {
      emit(state.copyWith(isLoading: true, id: event.id));
      try {
        final response = await _surveyRepository.getSurveyQuestions(event.id);
        emit(response.mapFromSurveyParams());
        logger.info("OnLoad survey response: $response");
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        logger.info("OnLoad survey error: $e");
      }
    }
  }
}
