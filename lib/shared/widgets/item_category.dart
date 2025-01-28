import '/core/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '/shared/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.onTap,
    this.isSelected = false,
  });

  final Category category;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 64.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 11,
          children: [
            Container(
              height: 64,
              width: 64,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primary : Colors.white,
                  border: isSelected
                      ? const Border.fromBorderSide(BorderSide.none)
                      : Border.all(color: const Color(0xFFE5E5E5)),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.25),
                            offset: const Offset(0, 8.67),
                            blurRadius: 21.68,
                          )
                        ]
                      : []),
              child: Image.network(
                category.icon,
                width: 32,
                height: 32,
                colorBlendMode: BlendMode.srcIn,
                color: isSelected ? Colors.white : const Color(0XFF000000),
              ),
            ),
            Text(
              category.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.inter(
                color: AppColors.textStrong,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 23 / 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
