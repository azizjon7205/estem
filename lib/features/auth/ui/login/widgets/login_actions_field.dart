import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/router/router.dart';
import '/core/router/router.gr.dart';
import '/core/styles/app_colors.dart';
import '/shared/widgets/app_elevated_button.dart';
import '/shared/widgets/app_text_field.dart';
import '/shared/widgets/sizes.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginActionsField extends StatelessWidget {
  const LoginActionsField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess == true) {
          navController.push( VerificationRoute(phoneNumber: state.phone));
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('Login Successful!')),
          // );
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }

        // if (state.isSuccess == false) {
        //   navController.push( VerificationRoute(phoneNumber: state.phone));
        // }
      },
      builder: (context, state) => Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 56.0,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray),
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Center(
                  child: Text(
                    '+998',
                    style: TextStyle(
                        color: Color(0xFF120D26),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        height: 23 / 14),
                  ),
                ),
              ),
              const Width(8.0),
              Expanded(
                child: AppTextField(
                  controller:
                      context.read<LoginBloc>().phoneNumberEditingController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(PhoneNumberChanged(context
                        .read<LoginBloc>()
                        .maskFormatter
                        .getMaskedText()),
                    );
                  },
                  inputFormatters: [context.read<LoginBloc>().maskFormatter],
                  hint: '99 111 22 33',
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
            ],
          ),
          const Height(40.0),
          AppElevatedButton(
            showLoader: state.isLoading,
            onTap: () {
              context.read<LoginBloc>().add(SubmitPhoneNumberEvent());
            },
            enabled: context.watch<LoginBloc>().state.isPhoneNumberValid,
            label: 'auth.sign_in'.tr().toUpperCase(),
            margin: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(bottom: 56.0),
          )
        ],
      ),
    );
  }
}
