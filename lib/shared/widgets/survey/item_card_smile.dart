import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_smile.dart';
import '../sizes.dart';
import 'item_required.dart';

class SmileItemCard extends StatefulWidget {
  const SmileItemCard({
    super.key,
    required this.question,
    required this.onSmileChanged,
    this.rating,
    this.total = 0,
    this.current = 0,
  });

  final SmileQuestion question;
  final int? rating;
  final int total;
  final int current;
  final Function(int) onSmileChanged;

  @override
  State<SmileItemCard> createState() => _SmileItemCardState();
}

class _SmileItemCardState extends State<SmileItemCard> {
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.question.question,
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 19.36 / 16,
              ),
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
          Row(
            spacing: 11.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...getSmileIcons().entries.map((entry) {
                final image = entry.key == widget.rating
                    ? entry.value.replaceAll('_pale', '')
                    : entry.value;
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    widget.onSmileChanged(entry.key);
                  },
                  child: SvgPicture.asset(image),
                );
              }),
            ],
          ),
          const Height(4.0),
          Text(
            widget.rating != null
                ? widget.question.ratingLabels[widget.rating!] ?? ''
                : '',
            style: GoogleFonts.inter(
              color: _getColor(widget.rating ?? 0),
              fontSize: 12,
              height: 14.52 / 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

_getColor(int rating) {
  switch (rating) {
    case 1:
      return AppColors.red;
    case 2:
      return AppColors.orange;
    case 3:
      return const Color(0xFF888693);
    case 4:
      return AppColors.blue;
    case 5:
      return AppColors.green;
    default:
      return Colors.transparent;
  }
}
