import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_upload_file.dart';
import 'item_required.dart';
import '../sizes.dart';

class UploadFileItemCard extends StatelessWidget {
  const UploadFileItemCard({
    super.key,
    required this.question,
    required this.onBrowseFileTap,
    this.total = 0,
    this.current = 0,
  });

  final UploadFileQuestion question;
  final int total;
  final int current;
  final VoidCallback onBrowseFileTap;

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
          const Height(16.0),
          GestureDetector(
            onTap: onBrowseFileTap,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12.0),
              dashPattern: const [7.5, 4],
              color: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  spacing: 16.0,
                  children: [
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: SvgPicture.asset('assets/icons/ic_folder.svg'),
                    ),
                    Text(
                      'question.upload_file'.tr(),
                      style: GoogleFonts.inter(
                        color: const Color(0xFF888693),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 23 / 14,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onBrowseFileTap,
                      clipBehavior: Clip.hardEdge,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12.0),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text(
                        'question.browse_file'.tr(),
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 23 / 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
