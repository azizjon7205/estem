import '/core/styles/app_shadows.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppShadows.formShadow],
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
