import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/create_bloc.dart';
import '../widgets/slot_create_survey_attributes.dart';
import '../widgets/slot_questions.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';
import '../widgets/slot_upload_image.dart';

@RoutePage()
class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateBloc>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColors.white,
        title: Text(
          'create.title'.tr(),
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 29.05 / 24,
            color: AppColors.textStrong,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: ListView(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          children: const [
            SlotUploadImage(),
            Height(32.0),
            SlotCreateSurveyAttributes(),
            Height(16.0),
            SlotQuestions(),
            Height(32.0),
          ],
        ),
      ),
    );
  }
}
