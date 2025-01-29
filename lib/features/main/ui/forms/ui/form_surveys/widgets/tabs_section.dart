import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '../bloc/forms_bloc.dart';
import '../bloc/forms_event.dart';
import '../bloc/forms_state.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FormsBloc>();
    return Container(
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        spacing: 8.0,
        children: Forms.values
            .map(
              (tab) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<FormsBloc>().add(LoadUserSurveys(tab.name));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: controller.state.tabState == tab.name
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        tab.label.tr(),
                        maxLines: 1,
                        style: GoogleFonts.inter(
                          color: controller.state.tabState == tab.name
                              ? AppColors.primary
                              : const Color(0xFF888693),
                          fontSize: 15,
                          height: 25 / 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
