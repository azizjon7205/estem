import 'package:auto_route/annotations.dart';
import 'package:estem/features/main/ui/wallet/ui/add_card/widgets/add_card_body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TestAppScreen extends StatelessWidget {
  const TestAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AddCardBody(),
      ),
    );
  }
}
