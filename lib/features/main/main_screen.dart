import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/injections.dart';
import 'bloc/main_bloc.dart';
import 'bloc/main_event.dart';
import 'main_body.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(repository: sl())..add(OnLoadUserData()),
      child: const MainBody(),
    );
  }
}

/**
 * SmileItemCard(
    question: StarRatingQuestion(
    question: "This is short answer question?",
    image: 'https://picsum.photos/id/1/200/300',
    isRequired: true,
    ratingLabels: {
    1.0: 'Worst',
    2.0: 'Not Good',
    3.0: 'Neutral',
    4.0: 'Good',
    5.0: 'Very Good',
    },
    ),
    rating: 1.0,
    onSmileChanged: (rating ) {  },
    )
 *
 * */
