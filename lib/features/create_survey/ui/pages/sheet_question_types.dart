import 'package:easy_localization/easy_localization.dart';
import '/core/router/router.dart';
import 'package:flutter/material.dart';

import '/core/styles/app_colors.dart';
import '/shared/models/question.dart';
import '../widgets/item_type_question.dart';

class QuestionTypesSheet extends StatelessWidget {
  const QuestionTypesSheet({super.key, required this.onTap});

  final Function(QuestionType) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0)
          .copyWith(top: 32, bottom: 24),
      child: Column(
        spacing: 12.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.shortAnswer);
                },
                iconPath: 'assets/icons/ic_type_short.svg',
                color: AppColors.primary,
                title: QuestionType.shortAnswer.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.longAnswer);
                },
                iconPath: 'assets/icons/ic_type_long.svg',
                color: AppColors.primary,
                title: QuestionType.longAnswer.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.email);
                },
                iconPath: 'assets/icons/ic_type_email.svg',
                color: AppColors.primary,
                title: QuestionType.email.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.number);
                },
                iconPath: 'assets/icons/ic_type_number.svg',
                color: AppColors.primary,
                title: QuestionType.number.title.tr(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.select);
                },
                iconPath: 'assets/icons/ic_type_select.svg',
                color: AppColors.purple,
                title: QuestionType.select.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.checkbox);
                },
                iconPath: 'assets/icons/ic_type_checkbox.svg',
                color: AppColors.purple,
                title: QuestionType.checkbox.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.dropdown);
                },
                iconPath: 'assets/icons/ic_type_dropdown.svg',
                color: AppColors.purple,
                title: QuestionType.dropdown.title.tr(),
              ),
              ItemTypeQuestion(
                onTap:() {
                  onTap(QuestionType.linearScale);
                },
                iconPath: 'assets/icons/ic_type_linear_scale.svg',
                color: AppColors.purple,
                title: QuestionType.linearScale.title.tr(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ItemTypeQuestion(
                  onTap:() {
                    onTap(QuestionType.date);
                  },
                  iconPath: 'assets/icons/ic_type_date.svg',
                  color: AppColors.green,
                  title: QuestionType.date.title.tr(),
                ),
              ),
              Expanded(
                child: ItemTypeQuestion(
                  onTap:() {
                    onTap(QuestionType.time);
                  },
                  iconPath: 'assets/icons/ic_type_time.svg',
                  color: AppColors.green,
                  title: QuestionType.time.title.tr(),
                ),
              ),
              Expanded(
                child: ItemTypeQuestion(
                  onTap:() {
                    onTap(QuestionType.fileUpload);
                  },
                  iconPath: 'assets/icons/ic_type_upload.svg',
                  color: AppColors.green,
                  title: QuestionType.fileUpload.title.tr(),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ItemTypeQuestion(
                  onTap:() {
                    onTap(QuestionType.starRating);
                  },
                  iconPath: 'assets/icons/ic_type_star.svg',
                  color: AppColors.orange,
                  title: QuestionType.starRating.title.tr(),
                ),
              ),
              Expanded(
                child: ItemTypeQuestion(
                  onTap:() {
                    onTap(QuestionType.smile);
                  },
                  iconPath: 'assets/icons/ic_type_smile.svg',
                  color: AppColors.orange,
                  title: QuestionType.smile.title.tr(),
                ),
              ),
              Expanded(child: Container()),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
