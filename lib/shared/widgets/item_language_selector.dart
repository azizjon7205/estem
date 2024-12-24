import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/shared/models/language.dart';
import 'package:estem/shared/widgets/app_container.dart';
import 'package:estem/shared/widgets/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemLanguageSelector extends StatelessWidget {
  const ItemLanguageSelector({super.key, required this.language, required this.isSelected, required this.onSelect});

  final Language language;
  final bool isSelected;
  final Function(Language) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(language);
      },
      child: AppContainer(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(language.flag, height: 36.0, width: 36.0,),
            const Width(8.0),
            Expanded(
              child: Text(language.label, style: GoogleFonts.inter(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 19.36 / 16.0,
                color: const Color(0xff120d26)
              ),),
            ),
            const Width(8.0),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: isSelected ? AppColors.primary : AppColors.gray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
