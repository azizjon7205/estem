import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_event.dart';
import '/core/utils/injections.dart';
import '../bloc/create_bloc.dart';
import '../widgets/create_survey_content.dart';

@RoutePage()
class CreateSurveyScreen extends StatelessWidget {
  const CreateSurveyScreen({super.key, this.id});

  final dynamic id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateBloc(
        categoriesRepository: sl(),
        regionsRepository: sl(),
        imageRepository: sl(),
        surveyRepository: sl(),
      )
        ..add(OnLoadCategories())
        ..add(OnLoadRegions())
        ..add(OnLoadSurveyToEdit(id)),
      child: const CreateSurveyContent(),
    );
  }
}
