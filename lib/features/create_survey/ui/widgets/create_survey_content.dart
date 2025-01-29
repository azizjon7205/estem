import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_colors.dart';
import '../bloc/create_bloc.dart';
import '../bloc/create_event.dart';
import '../dialogs/draft_alert_content.dart';
import '../dialogs/incomplete_warning_content.dart';
import 'fab_create_survey.dart';

class CreateSurveyContent extends StatelessWidget {
  const CreateSurveyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CreateBloc>();
    final watcher = context.watch<CreateBloc>();
    return BackButtonListener(
        onBackButtonPressed: () async {
          if (watcher.state.questions.isEmpty) {
            return false;
          } else {
            showAdaptiveDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: DraftAlertContent(
                    onYesTap: () {},
                    onNoTap: () {
                      controller.add(OnDeleteImage());
                      navController.maybePop().then((value) {
                        navController.maybePop();
                      });
                    }),
              ),
            );
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              const AutoRouter(),
              Visibility(
                visible: watcher.state.isLoading,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white.withValues(alpha: 0.4),
                  child: const Center(
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButton: const FabCreateSurvey(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            unselectedItemColor: const Color(0xFFd1cfd6),
            currentIndex: watcher.state.currentPage,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedLabelStyle: GoogleFonts.inter(
              color: const Color(0xFF2C3550),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            onTap: (value) {
              if (value == 0) {
                if (watcher.state.questions.isEmpty) {
                  navController.maybePop();
                } else {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: DraftAlertContent(
                          onYesTap: () {},
                          onNoTap: () {
                            controller.add(OnDeleteImage());
                            navController.maybePop();
                            navController.maybePop();
                          }),
                    ),
                  );
                }
              }

              if (value == 1 && watcher.state.currentPage != 1) {
                controller.add(OnPageChanged(1));
                context.replaceRoute(const BuilderRoute());
              }
              if (value == 3 && watcher.state.currentPage != 3) {
                print(
                    "Survey::: ${watcher.state.questions.map((element) => element.question.toJson())}");

                if (watcher.state.isReadyToCreate) {
                  controller.add(OnPageChanged(3));
                  context.replaceRoute(StartSurveyRoute(
                      survey: watcher.state.survey!,
                      isFromPreview: true,
                      onStartSurvey: () {
                        context.pushRoute(SurveyRoute(
                          id: null,
                          title: watcher.state.survey!.title,
                          questions: watcher.state.questions
                              .map((element) =>
                                  element.question.copyWith(id: element.id))
                              .toList(),
                          isFromPreview: true,
                        ));
                      }));
                } else {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: InCompleteWarningContent(onGoBackTap: () {
                        navController.maybePop();
                      }),
                    ),
                  );
                }
              }
              if (value == 4 && watcher.state.currentPage != 4) {
                if (watcher.state.isReadyToCreate) {
                  // send to submit
                } else {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: InCompleteWarningContent(onGoBackTap: () {
                        navController.maybePop();
                      }),
                    ),
                  );
                }
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_home.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_home.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'main.home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_edit.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_edit.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'create.builder'.tr(),
              ),
              const BottomNavigationBarItem(
                  icon: SizedBox(), activeIcon: SizedBox(), label: ''),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_preview.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_preview.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'create.preview'.tr(),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/ic_submit.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd1cfd6),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_submit.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                ),
                label: 'create.submit'.tr(),
              ),
            ],
          ),
        ));
  }
}
