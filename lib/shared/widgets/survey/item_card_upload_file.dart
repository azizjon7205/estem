import 'dart:convert';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/survey/domain/entities/answers/answer_upload_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_upload_file.dart';
import '../sizes.dart';
import 'item_required.dart';

class UploadFileItemCard extends StatefulWidget {
  const UploadFileItemCard({
    super.key,
    required this.question,
    required this.onBrowseFileTap,
    required this.answer,
    this.total = 0,
    this.current = 0,
    required this.onRemoveFile,
  });

  final UploadFileQuestion question;
  final int total;
  final int current;
  final UploadFileAnswer answer;
  final VoidCallback onBrowseFileTap;
  final VoidCallback onRemoveFile;

  @override
  State<UploadFileItemCard> createState() => _UploadFileItemCardState();
}

class _UploadFileItemCardState extends State<UploadFileItemCard> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _decodeImage();
  }

  void _decodeImage() {
    if (widget.question.image != null) {
      setState(() {
        _imageBytes = base64Decode(widget.question.image!);
      });
    } else {
      setState(() {
        _imageBytes = null;
      });
    }
  }

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
                  'question.label'.tr(args: [
                    widget.current.toString(),
                    widget.total.toString()
                  ]),
                  style: GoogleFonts.inter(
                    color: AppColors.primary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    height: 14.52 / 12,
                  ),
                ),
              ),
              if (widget.question.isRequired) const ItemRequired()
            ],
          ),
          const Height(6.0),
          Text(
            widget.question.question,
            style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 19.36 / 16,
            ),
          ),
          if (_imageBytes != null) ...[
            const Height(6.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.memory(
                _imageBytes!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
          const Height(16.0),
          GestureDetector(
            // onTap: widget.onBrowseFileTap,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(16.0),
              dashPattern: const [7.5, 4],
              color: AppColors.primary,
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: widget.answer.name?.isNotEmpty == true
                    ? Row(
                        spacing: 12.0,
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child:
                                SvgPicture.asset('assets/icons/ic_folder.svg'),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 2.0,
                              children: [
                                Text(
                                  widget.answer.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.textStrong,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 21 / 14,
                                  ),
                                ),
                                Text(
                                  '${widget.answer.size.toStringAsFixed(2)} MB',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.secondary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    height: 15 / 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onRemoveFile,
                            child: const Icon(
                              Icons.highlight_remove,
                              size: 20,
                              color: AppColors.red,
                            ),
                          )
                        ],
                      )
                    : Column(
                        spacing: 16.0,
                        children: [
                          SizedBox(
                            height: 36,
                            width: 36,
                            child:
                                SvgPicture.asset('assets/icons/ic_folder.svg'),
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
                            onPressed: widget.onBrowseFileTap,
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
