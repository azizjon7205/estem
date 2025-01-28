import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../../models/questions/option.dart';
import '../../models/questions/question_dropdown.dart';
import '../sizes.dart';
import 'item_required.dart';

class DropdownItemCard extends StatefulWidget {
  const DropdownItemCard({
    super.key,
    required this.question,
    required this.onOptionSelected,
    this.option,
    this.total = 0,
    this.current = 0,
  });

  final DropdownQuestion question;
  final dynamic option;
  final int total;
  final int current;
  final Function(Option) onOptionSelected;

  @override
  State<DropdownItemCard> createState() => _DropdownItemCardState();
}

class _DropdownItemCardState extends State<DropdownItemCard> {
  final GlobalKey dropdownKey = GlobalKey();
  late bool isMenuExpanded;

  Uint8List? _imageBytes;

  @override
  void initState() {
    isMenuExpanded = false;
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

  void onMenuStateChanged() {
    setState(() {
      isMenuExpanded = !isMenuExpanded;
    });
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
          GestureDetector(
            onTap: onMenuStateChanged,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: const Color(0xFFE4DFDF))),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.option != null
                        ? widget.question.options
                        .firstWhere(
                            (element) => element.id == widget.option!)
                        .option
                        : 'base.select'.tr(),
                    style: GoogleFonts.inter(
                      color: widget.option == null
                          ? const Color(0xFF747688)
                          : const Color(0xFF29253C),
                      fontSize: 14,
                      height: 23 / 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                    color: Color(0xFF888693),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: isMenuExpanded,
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                offset: const Offset(0, -15),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    minHeight: 0
                  ),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...widget.question.options
                            .map(
                              (item) => GestureDetector(
                            onTap: () {
                              widget.onOptionSelected(item);
                              onMenuStateChanged();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: item.id == widget.option
                                    ? const Color(0xFFDDE1FF)
                                    : Colors.transparent,
                              ),
                              child: Text(
                                item.option,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF29253C),
                                  fontSize: 14,
                                  height: 23 / 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
