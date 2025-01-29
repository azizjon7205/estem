import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../models/questions/question_option.dart';
import 'item_required.dart';
import 'sizes.dart';

class DropdownItemCard extends StatefulWidget {
  const DropdownItemCard({
    super.key,
    required this.question,
    required this.onOptionSelected,
    this.option,
    this.total = 0,
    this.current = 0,
  });

  final OptionQuestion question;
  final Option? option;
  final int total;
  final int current;
  final Function(Option) onOptionSelected;

  @override
  State<DropdownItemCard> createState() => _DropdownItemCardState();
}

class _DropdownItemCardState extends State<DropdownItemCard> {
  final GlobalKey dropdownKey = GlobalKey();
  double baseHeight = 0;
  late bool isMenuExpanded;

  @override
  void initState() {
    baseHeight = 155 + (widget.question.image != null ? 156 : 0);
    isMenuExpanded = false;
    super.initState();
  }

  void onMenuStateChanged(bool value) {
    setState(() {
      isMenuExpanded = value;
      if (value == true) {
        baseHeight = baseHeight + 39 * widget.question.options.length + 6;
      } else {
        baseHeight = baseHeight - 39 * widget.question.options.length - 6;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: const Duration(seconds: 1),
      // height: baseHeight,
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
          if (widget.question.image != null) ...[
            const Height(6.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.question.image!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
          const Height(16.0),
          DropdownButtonHideUnderline(
              child: DropdownButton2<Option>(
            onMenuStateChange: onMenuStateChanged,
            key: dropdownKey,
            alignment: Alignment.center,
            menuItemStyleData: const MenuItemStyleData(
                overlayColor: WidgetStateColor.transparent),
            dropdownStyleData: DropdownStyleData(
              // padding: const EdgeInsets.symmetric(vertical: 10),
              offset: const Offset(0, 12),
              // maxHeight: 300,
              scrollPadding: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF493E83).withValues(alpha: 0.1),
                    offset: const Offset(0, 16),
                    blurRadius: 32,
                  )
                ],
              ),
            ),
            onChanged: (value) {},
            isExpanded: true,
            buttonStyleData: const ButtonStyleData(
                overlayColor: WidgetStateColor.transparent),
            customButton: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: const Color(0xFFE4DFDF))),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.option != null
                        ? widget.option!.option
                        : 'base.select'.tr(),
                    style: GoogleFonts.inter(
                        color: widget.option == null
                            ? const Color(0xFF747688)
                            : const Color(0xFF29253C),
                        fontSize: 14,
                        height: 23 / 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                    color: Color(0xFF888693),
                  )
                ],
              ),
            ),
            items: widget.question.options
                .map(
                  (item) => DropdownMenuItem(
                    onTap: () {
                      widget.onOptionSelected(item);
                    },
                    value: item,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: item.id == widget.option?.id
                            ? const Color(0xFFDDE1FF)
                            : Colors.transparent,
                      ),
                      child: Text(
                        item.option,
                        style: GoogleFonts.inter(
                            color: const Color(0xFF29253C),
                            fontSize: 14,
                            height: 23 / 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          ),
        ],
      ),
    );
  }
}
