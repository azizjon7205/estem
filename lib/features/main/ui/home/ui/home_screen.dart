import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../../shared/widgets/app_sheet_content.dart';
import '../../../bloc/main_bloc.dart';
import '../../surveys/ui/filter/filter_screen.dart';
import '/core/styles/app_colors.dart';
import '/core/utils/injections.dart';
import '/shared/widgets/sizes.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'widgets/home_body.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.openDrawer});

  final Function openDrawer;

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      disableBarrierInteraction: true,
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Width(8.0),
              GestureDetector(
                onTap: () {
                  openDrawer();
                },
                child: SvgPicture.asset(
                  'assets/icons/ic_drawer.svg',
                  height: 24,
                  width: 19.2,
                ),
              ),
              const Width(16.0),
              Expanded(
                child: Text(
                  'User 001',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Width(16.0),
              GestureDetector(
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
                    builder: (context) => AppSheetContent(
                      content: FilterScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 36,
                  width: 36,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/ic_filter.svg',
                  ),
                ),
              ),
              const Width(8.0),
              GestureDetector(
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => HomeBloc(sl())
            ..add(LoadHomeCatalogs())
            ..add(LoadHomeSurveys()),
          child: const HomeBody(),
        ),
      ),
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
