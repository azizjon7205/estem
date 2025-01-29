
import '../../form_actions/bloc/form_actions_bloc.dart';
import '/core/utils/injections.dart';
import '../../form_actions/sheet_survey_actions.dart';
import '/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/shared/widgets/sizes.dart';
import '/shared/widgets/survey_item.dart';
import '../bloc/forms_bloc.dart';
import '../bloc/forms_state.dart';
import 'empty_section.dart';
import 'tabs_section.dart';

class FormsBody extends StatelessWidget {
  const FormsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocConsumer<FormsBloc, FormsState>(
        builder: (context, state) => Column(
          spacing: 16.0,
          children: [
            const TabsSection(),
            Expanded(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : state.surveys.isEmpty
                      ? const EmptySection()
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemBuilder: (context, i) => SurveyItem(
                            survey: state.surveys[i],
                            showBookmark: false,
                            onSurveySavedBookmark: (value) {},
                            onTap: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(38),
                                    topLeft: Radius.circular(38),
                                  ),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      FormActionsBloc(sl(), true),
                                  child: SurveyActionsSheet(
                                      survey: state.surveys[i]),
                                ),
                              );
                            },
                          ),
                          separatorBuilder: (context, i) => const Height(8.0),
                          itemCount: state.surveys.length,
                        ),
            )
          ],
        ),
        listener: (context, state) {},
      ),
    );
  }
}
