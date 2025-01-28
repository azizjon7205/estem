import 'package:estem/features/create_survey/domain/entities/survey_params.dart';

import '/shared/models/category.dart';
import '/shared/models/region.dart';
import '/shared/models/survey.dart';
import '../../domain/entities/question_entity.dart';

class CreateState {
  dynamic id;
  String? title;
  String? description;
  int? duration;
  String? image;
  dynamic tempImageId;
  bool imageLoading;
  double? price;
  dynamic categoryId;
  dynamic regionId;
  List<QuestionEntity> questions;
  QuestionEntity? tempQuestion;
  List<Category> categories;
  List<Region> regions;

  bool isLoading;
  String? successMessage;
  String? errorMessage;

  int currentPage;

  CreateState({
    this.id,
    this.title,
    this.categoryId,
    this.regionId,
    this.description,
    this.duration,
    this.price,
    this.image,
    this.tempImageId,
    this.tempQuestion,
    this.currentPage = 1,
    this.imageLoading = false,
    this.questions = const [],
    this.categories = const [],
    this.regions = const [],
    this.isLoading = false,
    this.successMessage = '',
    this.errorMessage = '',
  });

  CreateState copyWith({
    dynamic id,
    String? title,
    String? description,
    String? image,
    int? duration,
    double? price,
    dynamic categoryId,
    dynamic regionId,
    dynamic tempImageId,
    QuestionEntity? tempQuestion,
    List<QuestionEntity>? questions,
    List<Category>? categories,
    List<Region>? regions,
    int? currentPage,
    bool? imageLoading,
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return CreateState(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      regionId: regionId ?? this.regionId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      tempImageId: tempImageId ?? this.tempImageId,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      tempQuestion: tempQuestion ?? this.tempQuestion,
      questions: questions ?? this.questions,
      categories: categories ?? this.categories,
      regions: regions ?? this.regions,
      currentPage: currentPage ?? this.currentPage,
      imageLoading: imageLoading ?? this.imageLoading,
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Survey? get survey {
    if (image != null &&
        title?.isNotEmpty == true &&
        description?.isNotEmpty == true &&
        (duration ?? 0) != 0 &&
        (price ?? 0.0) != 0.0) {
      return Survey(
          image: image!,
          title: title!,
          description: description!,
          duration: duration!,
          price: price!,
          date: DateTime.now());
    } else {
      return null;
    }
  }

  bool get isReadyToCreate {
    return survey != null &&
        questions.isNotEmpty &&
        !questions.any(
          (element) => element.question.question.isEmpty,
        ) &&
        !questions.any(
          (element) => element.error != null,
        );
  }

  SurveyParams mapToSurveyParams() {
    return SurveyParams(
        id: id,
        title: title,
        description: description,
        image: image,
        duration: duration,
        price: price,
        regionId: regionId,
        categoryId: categoryId,
        questions: questions.map((element) => element.question).toList());
  }
}

extension SurveyParamsMapper on SurveyParams {
  CreateState mapFromSurveyParams() {
    return CreateState(
        id: id,
        title: title,
        description: description,
        image: image,
        duration: duration,
        price: price,
        regionId: regionId,
        categoryId: categoryId,
        questions: questions
            .map(
              (question) => QuestionEntity(question: question, id: question.id),
            )
            .toList());
  }
}
