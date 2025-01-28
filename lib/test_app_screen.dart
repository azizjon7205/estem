import 'package:auto_route/annotations.dart';
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
