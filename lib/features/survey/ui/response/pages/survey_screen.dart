import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/core/utils/injections.dart';
import '/shared/models/question.dart';
import '../bloc/survey_bloc.dart';
import '../bloc/survey_events.dart';
import '../widgets/survey_content.dart';

@RoutePage()
class SurveyScreen extends StatelessWidget {
  const SurveyScreen({
    super.key,
    this.id,
    this.questions = const [],
    required this.title,
    this.isFromPreview = false,
  });

  final List<Question> questions;
  final String title;
  final dynamic id;
  final bool isFromPreview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            color: AppColors.textStrong,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            height: 29.05 / 24,
          ),
        ),
      ),
      body: BlocProvider<SurveyBloc>(
        create: (context) => SurveyBloc(fileRepository: sl())
          ..add(id == null
              ? OnLoadPreviewQuestions(questions)
              : OnLoadQuestions(id)),
        child: const SurveyContent(),
      ),
    );
  }
}
