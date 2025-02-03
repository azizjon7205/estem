import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/core/styles/app_shadows.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, this.child, this.padding, this.onTap, this.width, this.margin});

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            AppShadows.cardShadow
          ],
        ),
        child: child,
      ),
    );
  }
}
