import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import '/shared/models/survey.dart';
import '/shared/widgets/sizes.dart';
import '/shared/widgets/survey_item.dart';
import 'card_category_home.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 99,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(33),
                  bottomRight: Radius.circular(33),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  spacing: 8.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Width(24),
                    Text(
                      '1 234 567.00 uzs',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 24.0,
                          height: 34 / 24,
                          fontWeight: FontWeight.w500),
                    ),
                    SvgPicture.asset('assets/icons/ic_show.svg')
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 24,
              right: 24,
              child: Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: CardCategoryHome(
                      color: AppColors.red,
                      prefixPath: 'assets/icons/ic_sports.svg',
                      label: 'Sports',
                    ),
                  ),
                  Expanded(
                    child: CardCategoryHome(
                      color: AppColors.orange,
                      prefixPath: 'assets/icons/ic_music.svg',
                      label: 'Music',
                    ),
                  ),
                  Expanded(
                    child: CardCategoryHome(
                      color: AppColors.green,
                      prefixPath: 'assets/icons/ic_science.svg',
                      label: 'Science',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Height(24),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'home.recent'.tr(),
                      style: GoogleFonts.inter(
                          color: AppColors.textStrong,
                          fontSize: 18,
                          height: 34 / 18,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      child: Row(
                        spacing: 5,
                        children: [
                          Text(
                            'home.see_all'.tr(),
                            style: GoogleFonts.inter(
                              color: AppColors.textSub,
                              fontSize: 14,
                              height: 23 / 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/ic_arrow_right.svg')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Height(11),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => SurveyItem(
                  survey: dummySurvey(),
                  isSavedBookmark: false,
                  onSurveySavedBookmark: (value) {},
                ),
                separatorBuilder: (context, i) => const Height(8.0),
                itemCount: 2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
