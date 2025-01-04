import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/models/questions/question_option.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import 'app_text_field.dart';
import 'item_required.dart';
import 'sizes.dart';

class MultipleSelectItemCard extends StatelessWidget {
  const MultipleSelectItemCard({
    super.key,
    required this.question,
    required this.onAnswerChanged,
    required this.onOptionSelected,
    this.options,
    this.total = 0,
    this.current = 0,
  });

  final OptionQuestion question;
  final int total;
  final int current;
  final List<Option>? options;
  final Function(String) onAnswerChanged;
  final Function(Option) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF505588).withValues(alpha: 0.1),
              offset: const Offset(0, 8),
              blurRadius: 30,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'question.label'
                      .tr(args: [current.toString(), total.toString()]),
                  style: GoogleFonts.inter(
                    color: AppColors.primary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    height: 14.52 / 12,
                  ),
                ),
              ),
              if (question.isRequired) const ItemRequired()
            ],
          ),
          const Height(6.0),
          Text(
            question.question,
            style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 19.36 / 16),
          ),
          if (question.image != null) ...[
            const Height(6.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                question.image!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
          const Height(12.0),
          ...question.options.map(
            (item) => GestureDetector(
              onTap: () {
                onOptionSelected(item);
              },
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: options?.any((element) => element.id == item.id) ==
                              true
                          ? AppColors.primary
                          : AppColors.gray,
                    ),
                    const Width(8.0),
                    Text(
                      item.option,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 16.94 / 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          if(question.hasOther)
            ...[
              const Height(12.0),
              AppTextField(
                onChanged: onAnswerChanged,
                hint: "base.other".tr(),
              )
            ]
        ],
      ),
    );
  }
}
