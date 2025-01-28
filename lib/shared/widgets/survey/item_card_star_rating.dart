import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_rating.dart';
import '../sizes.dart';
import 'item_required.dart';

class StarRatingItemCard extends StatefulWidget {
  const StarRatingItemCard({
    super.key,
    required this.question,
    required this.onRatingChanged,
    this.rating,
    this.total = 0,
    this.current = 0,
  });

  final StarRatingQuestion question;
  final int? rating;
  final int total;
  final int current;
  final Function(int) onRatingChanged;

  @override
  State<StarRatingItemCard> createState() => _StarRatingItemCardState();
}

class _StarRatingItemCardState extends State<StarRatingItemCard> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
          RatingBar(
            initialRating: (widget.rating ?? 0).toDouble(),
            unratedColor: AppColors.gray,
            itemPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            itemSize: 20,
            itemCount: 5,
            ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: AppColors.yellow,
                  size: 20,
                ),
                half: const Icon(
                  Icons.star,
                  color: AppColors.gray,
                  size: 20,
                ),
                empty: const Icon(
                  Icons.star,
                  color: AppColors.gray,
                  size: 20,
                )),
            onRatingUpdate: (value) {
              widget.onRatingChanged(value.toInt());
            },
          ),
          const Height(4.0),
          Text(
            widget.rating != null ? widget.question.ratingLabels[widget.rating!] ?? '' : '',
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
