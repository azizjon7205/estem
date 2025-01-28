import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/core/utils/injections.dart';
import 'bloc/forms_bloc.dart';
import 'bloc/forms_event.dart';
import 'bloc/forms_state.dart';
import 'widgets/forms_body.dart';

@RoutePage()
class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        title: Text(
          'main.forms'.tr(),
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 29.05 / 24,
            color: AppColors.textStrong,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            FormsBloc(sl())..add(LoadUserSurveys(Forms.published.name)),
        child: const FormsBody(),
      ),
    );
  }
}
