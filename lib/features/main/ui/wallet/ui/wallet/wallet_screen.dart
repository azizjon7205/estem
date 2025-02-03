import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estem/features/main/ui/wallet/ui/wallet/widgets/wallet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/styles/app_colors.dart';
import 'bloc/wallet_bloc.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          'main.wallet'.tr(),
          style: GoogleFonts.inter(
              color: AppColors.textStrong,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocProvider(
        create: (context) => WalletBloc(),
        child: const WalletBody(),
      ),
    );
  }
}
