import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/question_time.dart';
import 'item_required.dart';
import '../sizes.dart';

class TimePickerItemCard extends StatefulWidget {
  const TimePickerItemCard({
    super.key,
    required this.question,
    required this.onHourChanged,
    required this.onMinutesChanged,
    this.hour,
    this.minutes,
    this.total = 0,
    this.current = 0,
  });

  final TimePickerQuestion question;
  final int? hour;
  final int? minutes;
  final int total;
  final int current;
  final Function(int) onHourChanged;
  final Function(int) onMinutesChanged;

  @override
  State<TimePickerItemCard> createState() => _TimePickerItemCardState();
}

class _TimePickerItemCardState extends State<TimePickerItemCard> {
  bool showHourPicker = false;
  bool showMinutesPicker = false;
  Uint8List? _imageBytes;

  @override
  void initState() {
    print('Hour: ${widget.hour} :: minutes: ${widget.minutes}');
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


  void onHourPickerChanged() {
    setState(() {
      showHourPicker = !showHourPicker;
    });
  }

  void onMinutesPickerChanged() {
    setState(() {
      showMinutesPicker = !showMinutesPicker;
    });
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
          Container(
            width: 144,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: AppColors.gray),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onHourPickerChanged,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: showHourPicker
                                ? AppColors.primary
                                : AppColors.gray),
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                        boxShadow: [
                          if (showHourPicker)
                            BoxShadow(
                              color: const Color(0xFF5669FF)
                                  .withValues(alpha: 0.2),
                              spreadRadius: 3.2,
                            )
                        ]),
                    child: Row(
                      children: [
                        Text(
                          (widget.hour ?? 0).toString().padLeft(2, '0'),
                          style: GoogleFonts.poppins(
                            color: widget.hour != null
                                ? AppColors.textStrong
                                : const Color(0xFFBDC0CC),
                            fontSize: 14.0,
                            height: 21 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: GoogleFonts.poppins(
                    color: AppColors.textStrong,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 21 / 14,
                  ),
                ),
                GestureDetector(
                  onTap: onMinutesPickerChanged,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: showMinutesPicker
                                ? AppColors.primary
                                : AppColors.gray),
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                        boxShadow: [
                          if (showMinutesPicker)
                            BoxShadow(
                              color: const Color(0xFF5669FF)
                                  .withValues(alpha: 0.2),
                              spreadRadius: 3.2,
                            )
                        ]),
                    child: Row(
                      children: [
                        Text(
                          (widget.minutes ?? 0).toString().padLeft(2, '0'),
                          style: GoogleFonts.poppins(
                            color: widget.minutes != null
                                ? AppColors.textStrong
                                : const Color(0xFFBDC0CC),
                            fontSize: 14.0,
                            height: 21 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -22),
            child: Container(
              width: 144,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: showHourPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      width: 42,
                      constraints: const BoxConstraints(
                        maxHeight: 120,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 16),
                              blurRadius: 32,
                              color: const Color(0xFF493E83)
                                  .withValues(alpha: 0.1),
                            )
                          ]),
                      child: ListView.builder(
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () {
                            widget.onHourChanged(i);
                            onHourPickerChanged();
                          },
                          child: Container(
                            width: 42,
                            decoration: BoxDecoration(
                              color: i == widget.hour
                                  ? AppColors.primary.withValues(alpha: 0.1)
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                i.toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 24 / 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: 24,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: showMinutesPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      width: 42,
                      constraints: const BoxConstraints(
                        maxHeight: 120,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 16),
                              blurRadius: 32,
                              color: const Color(0xFF493E83)
                                  .withValues(alpha: 0.1),
                            )
                          ]),
                      child: ListView.builder(
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () {
                            widget.onMinutesChanged(i * 5);
                            onMinutesPickerChanged();
                          },
                          child: Container(
                            width: 42,
                            decoration: BoxDecoration(
                              color: i == widget.minutes
                                  ? AppColors.primary.withValues(alpha: 0.1)
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                (i * 5).toString().padLeft(2, '0'),
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 24 / 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
