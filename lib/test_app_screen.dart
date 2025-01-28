import 'package:auto_route/annotations.dart';
import 'package:estem/features/create_survey/ui/dialogs/draft_alert_content.dart';
import 'package:estem/features/create_survey/ui/dialogs/incomplete_warning_content.dart';
import 'package:estem/features/create_survey/ui/dialogs/insufficient_funds_content.dart';
import 'package:estem/features/create_survey/ui/widgets/form_item_option.dart';
import 'package:estem/features/create_survey/ui/widgets/form_short_answer.dart';
import 'package:estem/features/create_survey/ui/widgets/slot_upload_image.dart';
import 'package:estem/features/main/forms/ui/form_actions/sheet_survey_actions.dart';
import 'package:estem/features/wallet/ui/dialogs/payment_success_content.dart';
import 'package:estem/shared/models/survey.dart';
import 'package:flutter/material.dart';

import 'features/wallet/ui/dialogs/card_added_success_content.dart';

@RoutePage()
class TestAppScreen extends StatelessWidget {
  const TestAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardAddedSuccessContent(onGoBackTap: () {  },),
      ),
    );
  }
}
