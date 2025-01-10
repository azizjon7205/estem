import 'package:auto_route/annotations.dart';
import 'package:estem/shared/models/questions/question_date.dart';
import 'package:estem/shared/models/questions/question_scale.dart';
import 'package:estem/shared/models/questions/question_time.dart';
import 'package:estem/shared/models/questions/question_upload_file.dart';
import 'package:estem/shared/widgets/survey/item_card_date_picker.dart';
import 'package:estem/shared/widgets/survey/item_card_scale.dart';
import 'package:estem/shared/widgets/survey/item_card_time_picker.dart';
import 'package:estem/shared/widgets/survey/item_card_upload_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/models/questions/question_rating.dart';
import '../../../../shared/widgets/survey/item_card_smile.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/sizes.dart';
import 'widgets/main_body.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.openDrawer});

  final Function openDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: ScaleItemCard(
          question: ScaleQuestion(
            question: "This is short answer question?",
            image: 'https://picsum.photos/id/1/200/300',
            isRequired: true,
            leftScale: 1,
            rightScale: 5,
            leftLabel: "Left Label",
            rightLabel: "Right Label",
          ),
          scale: 2,
          onScaleChanged: (value) {},
        ),
      ),
      // body: const MainBody(),
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

