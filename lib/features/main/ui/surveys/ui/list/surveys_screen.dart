import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/injections.dart';
import '../../domain/entities/filter_params.dart';
import 'bloc/surveys_bloc.dart';
import 'bloc/surveys_events.dart';
import 'widgets/surveys_body.dart';

@RoutePage()
class SurveysScreen extends StatelessWidget {
  const SurveysScreen({super.key, required this.params});

  final FilterParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveysBloc(sl())..add(OnLoadSurveys(params)),
      child: const SurveysBody(),
    );
  }
}
