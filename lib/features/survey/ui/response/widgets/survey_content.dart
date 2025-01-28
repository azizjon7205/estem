import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/router/router.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_checkbox.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_date.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_dropdown.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_email.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_linear_scale.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_long.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_number.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_select.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_short.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_smile.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_star_rating.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_time.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_upload_file.dart';
import 'package:estem/shared/widgets/app_alert_dialog_content.dart';
import 'package:estem/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/survey_events.dart';
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
import '/shared/widgets/survey/item_card_checkbox.dart';
import '/shared/widgets/survey/item_card_date_picker.dart';
import '/shared/widgets/survey/item_card_dropdown.dart';
import '/shared/widgets/survey/item_card_email.dart';
import '/shared/widgets/survey/item_card_long_answer.dart';
import '/shared/widgets/survey/item_card_number.dart';
import '/shared/widgets/survey/item_card_scale.dart';
import '/shared/widgets/survey/item_card_select.dart';
import '/shared/widgets/survey/item_card_short_answer.dart';
import '/shared/widgets/survey/item_card_smile.dart';
import '/shared/widgets/survey/item_card_star_rating.dart';
import '/shared/widgets/survey/item_card_time_picker.dart';
import '/shared/widgets/survey/item_card_upload_file.dart';
import '../bloc/survey_bloc.dart';
import '../bloc/survey_state.dart';

class SurveyContent extends StatelessWidget {
  const SurveyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SurveyBloc>();
    return BlocConsumer<SurveyBloc, SurveyState>(
      builder: (context, state) => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)
            .copyWith(bottom: 64),
        itemBuilder: (context, i) {
          {
            if (i == state.questions.length) {
              return Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: AppElevatedButton(
                  onTap: () {
                    controller.add(OnSubmit());
                  },
                  label: 'base.actions.submit'.tr().toUpperCase(),
                  hasSuffixNext: false,
                ),
              );
            }

            final element = state.questions[i];

            final total = state.questions.length;
            switch (element.questionType) {
              case QuestionType.shortAnswer:
                {
                  final question = element as ShortAnswerQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as ShortAnswer;
                  return ShortAnswerItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    value: answer.text,
                    onAnswerChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(text: value)));
                    },
                  );
                }
              case QuestionType.longAnswer:
                {
                  final question = element as LongAnswerQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as LongAnswer;
                  return LongAnswerItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    value: answer.text,
                    onAnswerChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(text: value)));
                    },
                  );
                }
              case QuestionType.email:
                {
                  final question = element as EmailQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as EmailAnswer;
                  return EmailItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    value: answer.text,
                    onAnswerChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(text: value)));
                    },
                  );
                }
              case QuestionType.number:
                {
                  final question = element as NumberQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as NumberAnswer;
                  return NumberItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    value: answer.text,
                    onAnswerChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(text: value)));
                    },
                  );
                }
              case QuestionType.select:
                {
                  final question = element as SelectQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == question.id)
                          as SelectAnswer;
                  return SelectItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    option: answer.option,
                    other: answer.other,
                    onOtherChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(other: value)));
                    },
                    onOptionSelected: (option) {
                      controller.add(
                          OnAnswerChanged(answer.copyWith(option: option.id)));
                    },
                  );
                }
              case QuestionType.checkbox:
                {
                  final question = element as CheckBoxQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as CheckboxAnswer;
                  return CheckboxItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    options: answer.options?.toList(),
                    other: answer.other,
                    onOtherChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(other: value)));
                    },
                    onOptionSelected: (option) {
                      final options = answer.options ?? <dynamic>{};
                      if (!options.add(option.id)) {
                        options.remove(option.id);
                      }
                      controller.add(
                          OnAnswerChanged(answer.copyWith(options: options)));
                    },
                  );
                }
              case QuestionType.dropdown:
                {
                  final question = element as DropdownQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as DropdownAnswer;
                  return DropdownItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    option: answer.option,
                    onOptionSelected: (option) {
                      controller.add(
                          OnAnswerChanged(answer.copyWith(option: option.id)));
                    },
                  );
                }
              case QuestionType.linearScale:
                {
                  final question = element as ScaleQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as LinearScaleAnswer;
                  return ScaleItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    scale: answer.scale,
                    onScaleChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(scale: value)));
                    },
                  );
                }
              case QuestionType.date:
                {
                  final question = element as DatePickerQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as DateAnswer;
                  return DatePickerItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    date: answer.date,
                    onDateChanged: (date) {
                      controller.add(OnAnswerChanged(
                          answer.copyWith(date: date.toString())));
                    },
                  );
                }
              case QuestionType.time:
                {
                  final question = element as TimePickerQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as TimeAnswer;
                  final times = answer.time?.split(":");
                  final hour =
                      int.tryParse(answer.time?.split(":").first ?? '');
                  final minute = times?.length == 2
                      ? int.tryParse(answer.time?.split(":").last ?? '')
                      : null;

                  return TimePickerItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    hour: hour,
                    minutes: minute,
                    onHourChanged: (hour) {
                      controller.add(OnAnswerChanged(answer.copyWith(
                          time:
                              '$hour:${(minute ?? 0).toString().padLeft(2, '0')}')));
                    },
                    onMinutesChanged: (minute) {
                      controller.add(OnAnswerChanged(answer.copyWith(
                          time:
                              '${hour ?? 0}:${minute.toString().padLeft(2, '0')}')));
                    },
                  );
                }
              case QuestionType.fileUpload:
                {
                  final question = element as UploadFileQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as UploadFileAnswer;
                  return UploadFileItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    answer: answer,
                    onBrowseFileTap: () {
                      controller.add(state.isPreview
                          ? OnUploadFileTemporary(answer)
                          : OnUploadFile(answer));
                    },
                    onRemoveFile: () {
                      controller.add(OnRemoveFile(answer));
                    },
                  );
                }
              case QuestionType.starRating:
                {
                  final question = element as StarRatingQuestion;
                  final answer =
                      state.answers.firstWhere((ans) => ans.id == element.id)
                          as StarRatingAnswer;
                  return StarRatingItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    rating: answer.rating,
                    onRatingChanged: (rating) {
                      controller.add(
                          OnAnswerChanged(answer.copyWith(rating: rating)));
                    },
                  );
                }
              case QuestionType.smile:
                {
                  final question = element as SmileQuestion;
                  final answer = state.answers
                      .firstWhere((ans) => ans.id == element.id) as SmileAnswer;
                  return SmileItemCard(
                    total: total,
                    current: i + 1,
                    question: question,
                    rating: answer.value,
                    onSmileChanged: (value) {
                      controller
                          .add(OnAnswerChanged(answer.copyWith(value: value)));
                    },
                  );
                }
            }
          }
        },
        separatorBuilder: (context, i) => const Height(16.0),
        itemCount: state.questions.length + (state.isPreview ? 0 : 1),
      ),
      listener: (context, state) {
        if (state.successMessage?.isNotEmpty == true) {
          showAdaptiveDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              content: AppAlertDialogContent(
                image: 'assets/images/im_payment_success.png',
                  title: 'wallet.congratulations'.tr(),
                  message: state.successMessage,
                  actionTitle: 'base.actions.go_home'.tr().toUpperCase(),
                  onActionDone: () {
                    navController.replaceAll([const MainRoute()]);
                  }),
            ),
          );
        }
      },
      listenWhen: (context, state) => state.successMessage?.isNotEmpty == true || state.errorMessage?.isNotEmpty == true,
    );
  }
}
