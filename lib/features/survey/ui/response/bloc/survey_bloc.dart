import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/log/app_logger.dart';
import '/shared/models/question.dart';
import '/shared/models/upload_file_params.dart';
import '../../../domain/entities/answer.dart';
import '../../../domain/entities/answers/answer_checkbox.dart';
import '../../../domain/entities/answers/answer_date.dart';
import '../../../domain/entities/answers/answer_dropdown.dart';
import '../../../domain/entities/answers/answer_email.dart';
import '../../../domain/entities/answers/answer_linear_scale.dart';
import '../../../domain/entities/answers/answer_long.dart';
import '../../../domain/entities/answers/answer_number.dart';
import '../../../domain/entities/answers/answer_select.dart';
import '../../../domain/entities/answers/answer_short.dart';
import '../../../domain/entities/answers/answer_smile.dart';
import '../../../domain/entities/answers/answer_star_rating.dart';
import '../../../domain/entities/answers/answer_time.dart';
import '../../../domain/entities/answers/answer_upload_file.dart';
import '../../../domain/repositories/upload_file_repository.dart';
import 'survey_events.dart';
import 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final UploadFileRepository _fileRepository;

  SurveyBloc({required UploadFileRepository fileRepository})
      : _fileRepository = fileRepository,
        super(
          SurveyState(
            questions: [],
            errorMessage: null,
            successMessage: null,
            isLoading: false,
          ),
        ) {
    on<OnLoadQuestions>(_onLoadQuestions);
    on<OnLoadPreviewQuestions>(_onLoadPreviewQuestions);
    on<OnSubmit>(_onSubmitSurvey);
    on<OnAnswerChanged>(_onAnswerChanged);
    on<OnUploadFile>(_onUploadFile);
    on<OnUploadFileTemporary>(_onUploadFileTemporary);
    on<OnRemoveFile>(_onRemoveFile);
  }

  void _onLoadQuestions(OnLoadQuestions event, Emitter<SurveyState> emit) {}

  void _onLoadPreviewQuestions(
      OnLoadPreviewQuestions event, Emitter<SurveyState> emit) {
    final answers = event.questions.map((question) {
      switch (question.questionType) {
        case QuestionType.shortAnswer:
          {
            return ShortAnswer(id: question.id);
          }
        case QuestionType.longAnswer:
          {
            return LongAnswer(id: question.id);
          }
        case QuestionType.email:
          {
            return EmailAnswer(id: question.id);
          }
        case QuestionType.number:
          {
            return NumberAnswer(id: question.id);
          }
        case QuestionType.select:
          {
            return SelectAnswer(id: question.id);
          }
        case QuestionType.checkbox:
          {
            return CheckboxAnswer(id: question.id);
          }
        case QuestionType.dropdown:
          {
            return DropdownAnswer(id: question.id);
          }
        case QuestionType.linearScale:
          {
            return LinearScaleAnswer(id: question.id);
          }
        case QuestionType.date:
          {
            return DateAnswer(id: question.id);
          }
        case QuestionType.time:
          {
            return TimeAnswer(id: question.id);
          }
        case QuestionType.fileUpload:
          {
            return UploadFileAnswer(id: question.id);
          }
        case QuestionType.starRating:
          {
            return StarRatingAnswer(id: question.id);
          }
        case QuestionType.smile:
          {
            return SmileAnswer(id: question.id);
          }
      }
    }).toList();

    emit(state.copyWith(
      questions: event.questions,
      answers: answers,
      isPreview: true,
    ));
  }

  void _onSubmitSurvey(OnSubmit event, Emitter<SurveyState> emit) {
    print("Answers: ==>> ${state.answers.map((e) => e.toJson())}");
    // emit(state.copyWith(successMessage: 'You have earned 500 uzs!', isLoading: false));
  }

  void _onAnswerChanged(OnAnswerChanged event, Emitter<SurveyState> emit) {
    final index =
        state.answers.indexWhere((element) => element.id == event.answer.id);

    if (index != -1) {
      final List<Answer> answers = [];
      answers.addAll(state.answers);
      answers[index] = event.answer;

      emit(state.copyWith(answers: answers));
    }
  }

  void _onUploadFile(OnUploadFile event, Emitter<SurveyState> emit) async {
    final index =
        state.answers.indexWhere((element) => element.id == event.answer.id);
    final answer = event.answer as UploadFileAnswer;
    final List<Answer> answers = [];
    if (index != -1) {
      answers.addAll(state.answers);
      answers[index] = answer.copyWith(isLoading: true);
      emit(state.copyWith(answers: answers));

      try {
        final response = await _fileRepository.uploadFile(UploadFileParams(
          type: 'question',
          surveyId: state.id,
          questionId: answer.id,
        ));
        answers[index] = answer.copyWith(
          isLoading: false,
          fileUrl: response.url,
          name: response.name,
        );
      } catch (e) {
        logger.info('UploadFile error: $e');
      }
    }
  }

  void _onUploadFileTemporary(
      OnUploadFileTemporary event, Emitter<SurveyState> emit) async {
    final index =
        state.answers.indexWhere((element) => element.id == event.answer.id);
    final answer = event.answer as UploadFileAnswer;
    final List<Answer> answers = [];
    if (index != -1) {
      answers.addAll(state.answers);
      answers[index] = answer.copyWith(isLoading: true);
      emit(state.copyWith(answers: answers));

      try {
        final response =
            await _fileRepository.uploadFileTemporary(UploadFileParams(
          type: 'question',
          surveyId: state.id,
          questionId: answer.id,
        ));
        answers[index] = answer.copyWith(
            isLoading: false,
            fileUrl: null,
            name: response.name,
            size: response.size);
        emit(state.copyWith(answers: answers));
        print('UploadFile response: $response');
      } catch (e) {
        answers[index] = answer.copyWith(isLoading: false);
        emit(state.copyWith(answers: answers));
        logger.info('UploadFile error: $e');
      }
    }
  }

  void _onRemoveFile(OnRemoveFile event, Emitter<SurveyState> emit) async {
    final index =
        state.answers.indexWhere((element) => element.id == event.answer.id);
    final answer = event.answer as UploadFileAnswer;
    final List<Answer> answers = [];
    if (index != -1) {
      answers.addAll(state.answers);

      try {
        if (answer.tempId != null) {
          answers[index] = answer.copyWith(isLoading: true);
          emit(state.copyWith(answers: answers));
          await _fileRepository.deleteFile(answer.tempId);
        }
        answers[index] =
            answer.copyWith(isLoading: false, fileUrl: '', name: '', size: 0.0);
        emit(state.copyWith(answers: answers));
        print('UploadFile response: ');
      } catch (e) {
        answers[index] = answer.copyWith(isLoading: false);
        emit(state.copyWith(answers: answers));
        logger.info('UploadFile error: $e');
      }
    }
  }
}
