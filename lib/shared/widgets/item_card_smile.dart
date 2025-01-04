import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/models/questions/question_rating.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../models/questions/question_short_answer.dart';
import 'app_text_field.dart';
import 'item_required.dart';
import 'sizes.dart';

class SmileItemCard extends StatelessWidget {
  const SmileItemCard({
    super.key,
    required this.question,
    required this.onSmileChanged,
    this.rating,
    this.total = 0,
    this.current = 0,
  });

  final StarRatingQuestion question;
  final double? rating;
  final int total;
  final int current;
  final Function(int) onSmileChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 16.0,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              question.question,
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 19.36 / 16,
              ),
            ),
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
          const Height(16.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/ic_face_weary_pale.svg'),
              const Width(11),
              SvgPicture.asset('assets/icons/ic_face_frowning_pale.svg'),
              const Width(11),
              SvgPicture.asset('assets/icons/ic_face_neutral_pale.svg'),
              const Width(11),
              SvgPicture.asset('assets/icons/ic_face_smiling_pale.svg'),
              const Width(11),
              SvgPicture.asset('assets/icons/ic_face_grinning_pale.svg'),
            ],
          ),
          const Height(16.0),
          Text(
            rating != null ? question.ratingLabels[rating!] ?? '' : '',
            style: GoogleFonts.inter(
                color: _getColor(rating ?? 0.0),
                fontSize: 12,
                height: 14.52 / 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

_getColor(double rating) {
  switch(rating) {
    case 1.0: return AppColors.red;
    case 2.0: return AppColors.orange;
    case 3.0: return const Color(0xFF888693);
    case 4.0: return AppColors.blue;
    case 5.0: return AppColors.green;
    default : return Colors.transparent;
  }
}

