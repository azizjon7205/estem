import 'package:estem/core/styles/app_colors.dart';
import 'package:estem/core/styles/app_shadows.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, this.child, this.padding});

  final Widget? child;
  final EdgeInsetsGeometry? padding;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          AppShadows.cardShadow
        ],
      ),
      child: child,
    );
  }
}
