import 'package:estem/features/main/ui/surveys/ui/filter/bloc/filter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/injections.dart';
import 'bloc/filter_bloc.dart';
import 'widgets/filter_body.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(sl())..add(OnLoadFilterAttr()),
      child: const FilterBody(),
    );
  }
}
