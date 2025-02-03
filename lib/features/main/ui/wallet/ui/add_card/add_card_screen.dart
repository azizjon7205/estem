import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import '/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/add_card_body.dart';

@RoutePage()
class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transfer.add_card'.tr(), style: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.textStrong,
        ),),
      ),
      body: AddCardBody(),
    );
  }
}
