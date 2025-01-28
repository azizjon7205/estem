import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '/core/router/router.dart';
import '/core/styles/app_colors.dart';
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
import '/shared/widgets/app_sheet_content.dart';
import '../bloc/create_bloc.dart';
import '../bloc/create_event.dart';
import '../pages/sheet_question_types.dart';
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

class FabCreateSurvey extends StatelessWidget {
  const FabCreateSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateBloc>();
    final watcher = context.watch<CreateBloc>();
    return GestureDetector(
      onTap: () {
        print("FAB create Survey: ${watcher.state.survey}");
        if (watcher.state.survey != null) {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(38),
                topLeft: Radius.circular(38),
              ),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) => AppSheetContent(
              content: QuestionTypesSheet(
                onTap: (value) async {
                  await navController.maybePop();
                  Question question;
                  switch (value) {
                    case QuestionType.shortAnswer:
                      question =
                          ShortAnswerQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.longAnswer:
                      question =
                          LongAnswerQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.email:
                      question = EmailQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.number:
                      question = NumberQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.select:
                      question = SelectQuestion(
                          question: '', isRequired: false, options: []);
                      break;
                    case QuestionType.checkbox:
                      question = CheckBoxQuestion(
                          question: '', isRequired: false, options: []);
                      break;
                    case QuestionType.dropdown:
                      question = DropdownQuestion(
                          question: '', isRequired: false, options: []);
                      break;
                    case QuestionType.linearScale:
                      question = ScaleQuestion(
                          question: '', isRequired: false, rightScale: 10);
                      break;
                    case QuestionType.date:
                      question =
                          DatePickerQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.time:
                      question =
                          TimePickerQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.fileUpload:
                      question =
                          UploadFileQuestion(question: '', isRequired: false);
                      break;
                    case QuestionType.starRating:
                      question = StarRatingQuestion(
                          question: '',
                          isRequired: false,
                          ratingLabels: {1: "", 2: "", 3: "", 4: "", 5: ""});
                      break;
                    case QuestionType.smile:
                      question = SmileQuestion(
                          question: '',
                          isRequired: false,
                          ratingLabels: {1: "", 2: "", 3: "", 4: "", 5: ""});
                      break;
                  }
                  controller.add(OnAddTempQuestion(question));
                  showAdaptiveDialog<bool>(
                      context: context,
                      builder: (context) {
                        final questionEntity = watcher.state.tempQuestion!;
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Builder(builder: (context) {
                            switch (value) {
                              case QuestionType.shortAnswer:
                                {
                                  return FormShortAnswer(
                                    question: question as ShortAnswerQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.longAnswer:
                                {
                                  return FormLongAnswer(
                                    question: question as LongAnswerQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.email:
                                {
                                  return FormEmail(
                                    question: question as EmailQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.number:
                                {
                                  return FormNumber(
                                    question: question as NumberQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.select:
                                {
                                  controller.add(OnTempQuestionChanged(
                                      questionEntity.copyWith(
                                          additionalLabel:
                                          'question.add_option'.tr())));
                                  return FormSelect(
                                    question: question as SelectQuestion,
                                    onQuestionChanged: (query) {
                                      final label = (query as SelectQuestion)
                                          .options
                                          .isNotEmpty
                                          ? 'question.show_options'.tr(args: [
                                        query.options.length.toString()
                                      ])
                                          : 'question.add_option'.tr();
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query,
                                              additionalLabel: label)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.checkbox:
                                {
                                  controller.add(OnTempQuestionChanged(
                                      questionEntity.copyWith(
                                          additionalLabel:
                                          'question.add_option'.tr())));
                                  return FormCheckbox(
                                    question: question as CheckBoxQuestion,
                                    onQuestionChanged: (query) {
                                      final label = (query as CheckBoxQuestion)
                                          .options
                                          .isNotEmpty
                                          ? 'question.show_options'.tr(args: [
                                        query.options.length.toString()
                                      ])
                                          : 'question.add_option'.tr();
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query,
                                              additionalLabel: label)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.dropdown:
                                {
                                  controller.add(OnTempQuestionChanged(
                                      questionEntity.copyWith(
                                          additionalLabel:
                                          'question.add_option'.tr())));
                                  return FormDropdown(
                                    question: question as DropdownQuestion,
                                    onQuestionChanged: (query) {
                                      final label = (query as DropdownQuestion)
                                          .options
                                          .isNotEmpty
                                          ? 'question.show_options'.tr(args: [
                                        query.options.length.toString()
                                      ])
                                          : 'question.add_option'.tr();
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query,
                                              additionalLabel: label)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.linearScale:
                                {
                                  return FormLinearScale(
                                    question: question as ScaleQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.date:
                                {
                                  return FormDatePicker(
                                    question: question as DatePickerQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.time:
                                {
                                  return FormTimePicker(
                                    question: question as TimePickerQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.fileUpload:
                                {
                                  return FormFileUpload(
                                    question: question as UploadFileQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.starRating:
                                {
                                  controller.add(OnTempQuestionChanged(
                                      questionEntity.copyWith(
                                          additionalLabel: 'question.show_options'
                                              .tr(args: ['5']))));
                                  return FormStarRating(
                                    question: question as StarRatingQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                              case QuestionType.smile:
                                {
                                  controller.add(OnTempQuestionChanged(
                                      questionEntity.copyWith(
                                          additionalLabel: 'question.show_options'
                                              .tr(args: ['5']))));
                                  return FormSmile(
                                    question: question as SmileQuestion,
                                    onQuestionChanged: (query) {
                                      controller.add(OnTempQuestionChanged(
                                          questionEntity.copyWith(
                                              question: query)));
                                    },
                                    onDelete: () {
                                      navController.maybePop(false);
                                    },
                                  );
                                }
                            }
                          }),
                        );
                      }).then((value) {
                    if (watcher.state.tempQuestion != null && value != false) {
                      final questionL = watcher.state.tempQuestion!.question;
                      var label = '';
                      String? error = null;
                      var counter = 0;

                      if (questionL is SelectQuestion) {
                        label = questionL.options.isNotEmpty
                            ? 'question.show_options'
                            .tr(args: [questionL.options.length.toString()])
                            : 'question.add_option'.tr();
                        error = questionL.options.isEmpty ? 'question.add_option'.tr() : null;
                        questionL.options = questionL.options
                            .map(
                              (element) => element.option.isNotEmpty
                              ? element
                              : element.copyWith(
                            option: 'question.option_hint'
                                .tr(args: ['${counter++}']),
                          ),
                        )
                            .toList();
                      }
                      if (questionL is CheckBoxQuestion) {
                        label = questionL.options.isNotEmpty
                            ? 'question.show_options'
                            .tr(args: [questionL.options.length.toString()])
                            : 'question.add_option'.tr();
                        error = questionL.options.isEmpty ? 'question.add_option'.tr() : null;
                        questionL.options = questionL.options
                            .map(
                              (element) => element.option.isNotEmpty
                              ? element
                              : element.copyWith(
                            option: 'question.option_hint'
                                .tr(args: ['${counter++}']),
                          ),
                        )
                            .toList();
                      }
                      if (questionL is DropdownQuestion) {
                        label = questionL.options.isNotEmpty
                            ? 'question.show_options'
                            .tr(args: [questionL.options.length.toString()])
                            : 'question.add_option'.tr();
                        error = questionL.options.isEmpty ? 'question.add_option'.tr() : null;
                        questionL.options = questionL.options
                            .map(
                              (element) => element.option.isNotEmpty
                              ? element
                              : element.copyWith(
                            option: 'question.option_hint'
                                .tr(args: ['${counter++}']),
                          ),
                        )
                            .toList();
                      }
                      if (questionL is ScaleQuestion) {
                        label = 'question.show_scale'
                            .tr(args: [questionL.rightScale.toString()]);
                      }

                      if (questionL is StarRatingQuestion) {
                        label = 'question.show_options'.tr(args: ['5']);
                        questionL.ratingLabels = questionL.ratingLabels.map(
                              (key, value) => MapEntry(
                              key,
                              value.isNotEmpty
                                  ? value
                                  : 'question.strings.${getSmileStrings()[key]}'
                                  .tr()),
                        );
                      }
                      if (questionL is SmileQuestion) {
                        label = 'question.show_options'.tr(args: ['5']);
                        questionL.ratingLabels = questionL.ratingLabels.map(
                              (key, value) => MapEntry(
                              key,
                              value.isNotEmpty
                                  ? value
                                  : 'question.strings.${getSmileStrings()[key]}'
                                  .tr()),
                        );
                      }

                      controller.add(OnAddQuestion(watcher.state.tempQuestion!
                          .copyWith(
                          additionalLabel: label, question: questionL, error: error)));
                    }
                  });
                },
              ),
            ),
          );
        } else {
          // show error snack bar to force to fill the all fields
        }

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 62,
        width: 62,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -3),
                blurRadius: 8,
                color: const Color(0xFF9DB2D6).withValues(alpha: 0.1),
              )
            ]),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 20,
                color: const Color(0xFF4A43EC).withValues(alpha: 0.2),
              )
            ],
          ),
          child: SvgPicture.asset('assets/icons/ic_add.svg'),
        ),
      ),
    );
  }
}
