import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estem/shared/models/questions/question_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../app_text_field.dart';
import '../sizes.dart';
import 'item_required.dart';

class EmailItemCard extends StatefulWidget {
  const EmailItemCard({
    super.key,
    required this.question,
    required this.onAnswerChanged,
    this.total = 0,
    this.current = 0,
    this.value,
  });

  final EmailQuestion question;
  final int total;
  final int current;
  final String? value;
  final Function(String) onAnswerChanged;

  @override
  State<EmailItemCard> createState() => _EmailItemCardState();
}

class _EmailItemCardState extends State<EmailItemCard> {
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
          AppTextField(
            value: widget.value,
            onChanged: widget.onAnswerChanged,
            hint: "question.answer".tr(),
          )
        ],
      ),
    );
  }
}
