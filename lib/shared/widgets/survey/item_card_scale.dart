import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_scale.dart';
import '../sizes.dart';
import 'item_required.dart';

class ScaleItemCard extends StatefulWidget {
  const ScaleItemCard({
    super.key,
    required this.question,
    required this.onScaleChanged,
    this.total = 0,
    this.current = 0,
    this.scale,
  });

  final ScaleQuestion question;
  final int total;
  final int current;
  final int? scale;
  final Function(int) onScaleChanged;

  @override
  State<ScaleItemCard> createState() => _ScaleItemCardState();
}

class _ScaleItemCardState extends State<ScaleItemCard> {
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
                  'question.label'
                      .tr(args: [widget.current.toString(), widget.total.toString()]),
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
                height: 19.36 / 16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = widget.question.leftScale; i <= widget.question.rightScale; i++)
                GestureDetector(
                  onTap: () {
                    widget.onScaleChanged(i);
                  },
                  child: Column(
                    children: [
                      Text(
                        '$i',
                        style: GoogleFonts.inter(
                            color: AppColors.textStrong,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 23 / 14),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        // margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color:
                                widget.scale == i ? AppColors.primary : AppColors.gray,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
          if (widget.question.rightLabel != null || widget.question.leftLabel != null) ...[
            const Height(8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.question.leftLabel ?? '',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF888693),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    height: 14.52 / 12,
                  ),
                ),
                Text(
                  widget.question.rightLabel ?? '',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF888693),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    height: 14.52 / 12,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
