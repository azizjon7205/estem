import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/shared/widgets/app_container.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_text_field.dart';

class AddCardBody extends StatelessWidget {
  const AddCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppContainer(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                hint: 'Card name',
              ),
              AppTextField(
                hint: 'Card number',
              ),
              SizedBox(
                width: 90,
                child: AppTextField(
                  hint: 'MM/YY',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 52).copyWith(bottom: 36),
          child: AppElevatedButton(
            enabled: false,
            label: 'base.actions.continue'.tr().toUpperCase(),
          ),
        )
      ],
    );
  }
}
