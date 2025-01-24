import 'package:estem/core/helper/helper.dart';
import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/shared/models/survey.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyItem extends StatelessWidget {
  const SurveyItem({
    super.key,
    required this.survey,
    required this.isSavedBookmark,
    required this.onSurveySavedBookmark,
  });

  final Survey survey;
  final bool isSavedBookmark;
  final Function(Survey) onSurveySavedBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF505588).withValues(alpha: 0.1),
                offset: const Offset(0, 8),
                blurRadius: 30)
          ]),
      child: Row(
        children: [
          SizedBox(
            height: 92,
            width: 79,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.network(
                survey.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Width(16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Helper.dateFormatWithMonth(survey.date),
                      style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        height: 14.52 / 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onSurveySavedBookmark(survey);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          isSavedBookmark
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_border_rounded,
                          color: isSavedBookmark
                          ? AppColors.red
                          : AppColors.textStrong,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 38.72,
                      child: Text(
                        'Women\'s leadership conference',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            color: AppColors.textStrong,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            height: 19.36 / 16.0),
                      ),
                    ),
                    const Height(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_filled,
                          color: Color(0xFF747688),
                          size: 20,
                        ),
                        const Width(4),
                        Text(
                          '${survey.duration} min',
                          style: GoogleFonts.inter(
                              color: const Color(0xFF747688),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 15.73 / 13),
                        ),
                        const Spacer(),
                        Text(
                          '${survey.price}uzs',
                          style: GoogleFonts.inter(
                              color: const Color(0xFF747688),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              height: 15.73 / 13),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
