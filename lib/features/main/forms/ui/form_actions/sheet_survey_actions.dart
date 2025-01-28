import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_colors.dart';
import '/shared/models/survey.dart';
import 'bloc/form_actions_bloc.dart';
import 'bloc/form_actions_event.dart';
import 'widgets/sheet_action_tile.dart';
import 'widgets/sheet_status_tile.dart';

class SurveyActionsSheet extends StatelessWidget {
  const SurveyActionsSheet({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
        minHeight: MediaQuery.of(context).size.height * 0.15,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(38),
          topRight: Radius.circular(38),
        ),
        child: Wrap(
          children: [
            SizedBox(
              height: 195,
              child: Stack(
                children: [
                  Image.network(
                    survey.image,
                    height: 195,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // height: 64,
                      padding: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                      child: Text(
                        survey.title,
                        style: GoogleFonts.inter(
                          color: AppColors.textStrong,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 24 / 20,
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 6),
                        height: 4,
                        width: 36,
                        decoration: BoxDecoration(
                            color:
                                const Color(0xFFB2B2B2).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(2)),
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Column(
                spacing: 12.0,
                children: [
                  SheetStatusTile(
                      active: context.watch<FormActionsBloc>().state.status,
                      onStatusChanged: (value) {
                        context
                            .read<FormActionsBloc>()
                            .add(OnStatusChanged(value));
                      }),
                  SheetActionTile(
                    leading: Container(
                      width: 48.0,
                      height: 48.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SvgPicture.asset('assets/icons/ic_share.svg'),
                    ),
                    title: 'base.actions.share'.tr(),
                    onTap: () {},
                  ),
                  SheetActionTile(
                    leading: Container(
                      width: 48.0,
                      height: 48.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF888693).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SvgPicture.asset('assets/icons/ic_edit.svg'),
                    ),
                    title: 'base.actions.edit'.tr(),
                    onTap: () {},
                  ),
                  SheetActionTile(
                    leading: Container(
                      width: 48.0,
                      height: 48.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.purple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SvgPicture.asset('assets/icons/ic_show_2.svg'),
                    ),
                    title: 'base.actions.view'.tr(),
                    onTap: () {
                      navController.maybePop();
                      navController.push(StartSurveyRoute(
                          survey: survey,
                          onStartSurvey: () {
                            navController.push(SurveyRoute(
                                id: survey.id,
                                title: survey.title,
                                isFromPreview: true,
                            ));
                          }));
                    },
                  ),
                  SheetActionTile(
                    leading: Container(
                      width: 48.0,
                      height: 48.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SvgPicture.asset('assets/icons/ic_duplicate.svg'),
                    ),
                    title: 'base.actions.duplicate'.tr(),
                    onTap: () {},
                  ),
                  SheetActionTile(
                    leading: Container(
                      width: 48.0,
                      height: 48.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SvgPicture.asset('assets/icons/ic_delete.svg'),
                    ),
                    title: 'base.actions.delete'.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
