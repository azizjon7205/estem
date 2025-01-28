import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/router/router.dart';
import '/shared/models/question.dart';
import '/shared/models/questions/question_checkbox.dart';
import '/shared/models/questions/question_date.dart';
import '/shared/models/questions/question_dropdown.dart';
import '/shared/models/questions/question_email.dart';
import '/shared/models/questions/question_long_answer.dart';
import '/shared/models/questions/question_number.dart';
import '/shared/models/questions/question_rating.dart';
import '/shared/models/questions/question_scale.dart';
import '/shared/models/questions/question_select.dart';
import '/shared/models/questions/question_short_answer.dart';
import '/shared/models/questions/question_smile.dart';
import '/shared/models/questions/question_time.dart';
import '/shared/models/questions/question_upload_file.dart';
import '/shared/widgets/sizes.dart';
import '../bloc/create_bloc.dart';
import '../bloc/create_event.dart';
import 'form_checkbox.dart';
import 'form_date_picker.dart';
import 'form_dropdown.dart';
import 'form_email.dart';
import 'form_file_upload.dart';
import 'form_linear_scale.dart';
import 'form_long_answer.dart';
import 'form_number.dart';
import 'form_select.dart';
import 'form_short_answer.dart';
import 'form_smile.dart';
import 'form_star_rating.dart';
import 'form_time_picker.dart';
import 'item_question.dart';

class SlotQuestions extends StatelessWidget {
  const SlotQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateBloc>();
    final watcher = context.watch<CreateBloc>();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) => ItemQuestion(
        onTap: () {
          showAdaptiveDialog(
              context: context,
              builder: (context) {
                final questionEntity = controller.state.questions[i];

                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Builder(builder: (context) {
                    switch (questionEntity.question.questionType) {
                      case QuestionType.shortAnswer:
                        {
                          final question =
                              questionEntity.question as ShortAnswerQuestion;
                          return FormShortAnswer(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.longAnswer:
                        {
                          final question =
                              questionEntity.question as LongAnswerQuestion;
                          return FormLongAnswer(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.email:
                        {
                          final question =
                              questionEntity.question as EmailQuestion;
                          return FormEmail(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.number:
                        {
                          final question =
                              questionEntity.question as NumberQuestion;
                          return FormNumber(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.select:
                        {
                          final question =
                              questionEntity.question as SelectQuestion;
                          return FormSelect(
                            question: question,
                            onQuestionChanged: (query) {
                              final label = (query as SelectQuestion)
                                      .options
                                      .isNotEmpty
                                  ? 'question.show_options'.tr(
                                      args: [query.options.length.toString()])
                                  : 'question.add_option'.tr();
                              final error = query.options.isEmpty
                                  ? 'question.add_option'.tr()
                                  : null;
                              controller.add(
                                  OnQuestionChanged(questionEntity.copyWith(
                                question: query,
                                additionalLabel: label,
                                error: error,
                              )));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.checkbox:
                        {
                          final question =
                              questionEntity.question as CheckBoxQuestion;
                          return FormCheckbox(
                            question: question,
                            onQuestionChanged: (query) {
                              final label = (query as CheckBoxQuestion)
                                      .options
                                      .isNotEmpty
                                  ? 'question.show_options'.tr(
                                      args: [query.options.length.toString()])
                                  : 'question.add_option'.tr();
                              final error = query.options.isEmpty
                                  ? 'question.add_option'.tr()
                                  : null;
                              controller.add(
                                  OnQuestionChanged(questionEntity.copyWith(
                                question: query,
                                additionalLabel: label,
                                error: error,
                              )));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.dropdown:
                        {
                          final question =
                              questionEntity.question as DropdownQuestion;
                          return FormDropdown(
                            question: question,
                            onQuestionChanged: (query) {
                              final label = (query as DropdownQuestion)
                                      .options
                                      .isNotEmpty
                                  ? 'question.show_options'.tr(
                                      args: [query.options.length.toString()])
                                  : 'question.add_option'.tr();
                              final error = query.options.isEmpty
                                  ? 'question.add_option'.tr()
                                  : null;
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(
                                      question: query,
                                      additionalLabel: label,
                                      error: error)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.linearScale:
                        {
                          final question =
                              questionEntity.question as ScaleQuestion;
                          return FormLinearScale(
                            question: question,
                            onQuestionChanged: (query) {
                              final label = 'question.show_scale'.tr(args: [
                                (query as ScaleQuestion).rightScale.toString()
                              ]);
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(
                                      question: query,
                                      additionalLabel: label)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.date:
                        {
                          final question =
                              questionEntity.question as DatePickerQuestion;
                          return FormDatePicker(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.time:
                        {
                          final question =
                              questionEntity.question as TimePickerQuestion;
                          return FormTimePicker(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.fileUpload:
                        {
                          final question =
                              questionEntity.question as UploadFileQuestion;
                          return FormFileUpload(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.starRating:
                        {
                          final question =
                              questionEntity.question as StarRatingQuestion;
                          return FormStarRating(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                      case QuestionType.smile:
                        {
                          final question =
                              questionEntity.question as SmileQuestion;
                          return FormSmile(
                            question: question,
                            onQuestionChanged: (query) {
                              controller.add(OnQuestionChanged(
                                  questionEntity.copyWith(question: query)));
                            },
                            onDelete: () {
                              navController.maybePop();
                              controller
                                  .add(OnDeleteQuestion(questionEntity.id));
                            },
                          );
                        }
                    }
                  }),
                );
              });
        },
        questionEntity: watcher.state.questions[i],
        onDelete: () {
          controller.add(OnDeleteQuestion(watcher.state.questions[i].id));
        },
        onDuplicate: () {
          controller.add(OnDuplicateQuestion(watcher.state.questions[i].id));
          if (watcher.state.tempQuestion != null) {
            showAdaptiveDialog(
                context: context,
                builder: (context) {
                  final questionEntity = watcher.state.tempQuestion!;

                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: Builder(builder: (context) {
                      switch (questionEntity.question.questionType) {
                        case QuestionType.shortAnswer:
                          {
                            final question =
                                questionEntity.question as ShortAnswerQuestion;
                            return FormShortAnswer(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.longAnswer:
                          {
                            final question =
                                questionEntity.question as LongAnswerQuestion;
                            return FormLongAnswer(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.email:
                          {
                            final question =
                                questionEntity.question as EmailQuestion;
                            return FormEmail(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.number:
                          {
                            final question =
                                questionEntity.question as NumberQuestion;
                            return FormNumber(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.select:
                          {
                            final question =
                                questionEntity.question as SelectQuestion;
                            return FormSelect(
                              question: question,
                              onQuestionChanged: (query) {
                                final label = (query as SelectQuestion)
                                        .options
                                        .isNotEmpty
                                    ? 'question.show_options'.tr(
                                        args: [query.options.length.toString()])
                                    : 'question.add_option'.tr();
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(
                                        question: query,
                                        additionalLabel: label)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.checkbox:
                          {
                            final question =
                                questionEntity.question as CheckBoxQuestion;
                            return FormCheckbox(
                              question: question,
                              onQuestionChanged: (query) {
                                final label = (query as CheckBoxQuestion)
                                        .options
                                        .isNotEmpty
                                    ? 'question.show_options'.tr(
                                        args: [query.options.length.toString()])
                                    : 'question.add_option'.tr();
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(
                                        question: query,
                                        additionalLabel: label)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.dropdown:
                          {
                            final question =
                                questionEntity.question as DropdownQuestion;
                            return FormDropdown(
                              question: question,
                              onQuestionChanged: (query) {
                                final label = (query as DropdownQuestion)
                                        .options
                                        .isNotEmpty
                                    ? 'question.show_options'.tr(
                                        args: [query.options.length.toString()])
                                    : 'question.add_option'.tr();
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(
                                        question: query,
                                        additionalLabel: label)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.linearScale:
                          {
                            final question =
                                questionEntity.question as ScaleQuestion;
                            return FormLinearScale(
                              question: question,
                              onQuestionChanged: (query) {
                                final label = 'question.show_scale'.tr(args: [
                                  (query as ScaleQuestion).rightScale.toString()
                                ]);
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(
                                        question: query,
                                        additionalLabel: label)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.date:
                          {
                            final question =
                                questionEntity.question as DatePickerQuestion;
                            return FormDatePicker(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.time:
                          {
                            final question =
                                questionEntity.question as TimePickerQuestion;
                            return FormTimePicker(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.fileUpload:
                          {
                            final question =
                                questionEntity.question as UploadFileQuestion;
                            return FormFileUpload(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.starRating:
                          {
                            final question =
                                questionEntity.question as StarRatingQuestion;
                            return FormStarRating(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                        case QuestionType.smile:
                          {
                            final question =
                                questionEntity.question as SmileQuestion;
                            return FormSmile(
                              question: question,
                              onQuestionChanged: (query) {
                                controller.add(OnQuestionChanged(
                                    questionEntity.copyWith(question: query)));
                              },
                              onDelete: () {
                                navController.maybePop();
                                controller
                                    .add(OnDeleteQuestion(questionEntity.id));
                              },
                            );
                          }
                      }
                    }),
                  );
                }).then((value) {
              controller.scrollController.animateTo(
                controller.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastOutSlowIn,
              );
            });
          }
        },
      ),
      separatorBuilder: (context, i) => const Height(16.0),
      itemCount: watcher.state.questions.length,
    );
  }
}
