import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estem/core/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_date.dart';
import '../sizes.dart';
import 'item_required.dart';

class DatePickerItemCard extends StatefulWidget {
  const DatePickerItemCard({
    super.key,
    required this.question,
    required this.onDateChanged,
    this.date,
    this.total = 0,
    this.current = 0,
  });

  final DatePickerQuestion question;
  final String? date;
  final int total;
  final int current;
  final Function(DateTime) onDateChanged;

  @override
  State<DatePickerItemCard> createState() => _DatePickerItemCardState();
}

class _DatePickerItemCardState extends State<DatePickerItemCard> {
  bool showPicker = false;
  Uint8List? _imageBytes;

  void onPickerChanged() {
    setState(() {
      showPicker = !showPicker;
    });
  }

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
          GestureDetector(
            onTap: onPickerChanged,
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: showPicker ? AppColors.primary : AppColors.gray),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    if (showPicker)
                      BoxShadow(
                        color: const Color(0xFF5669FF).withValues(alpha: 0.2),
                        spreadRadius: 3.2,
                      )
                  ]),
              child: Row(
                spacing: 8.0,
                children: [
                  SvgPicture.asset('assets/icons/ic_calendar.svg'),
                  Expanded(
                    child: Text(
                      widget.date != null
                          ? Helper.dateFormat(
                              DateTime.tryParse(widget.date!) ?? DateTime.now())
                          : 'question.choose_from_calendar'.tr(),
                      style: GoogleFonts.inter(
                        color: widget.date != null
                            ? AppColors.textStrong
                            : const Color(0xFF807A7A),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: showPicker,
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: const Offset(0, -15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 32,
                          offset: const Offset(0, 16),
                          color: const Color(0xFF493E83).withValues(alpha: 0.1),
                        )
                      ]),
                  child: CalendarDatePicker(
                    initialDate: widget.date != null
                        ? (DateTime.tryParse(widget.date!) ?? DateTime.now())
                        : DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2050),
                    onDateChanged: (value) {
                      widget.onDateChanged(value);
                      onPickerChanged();
                      },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
