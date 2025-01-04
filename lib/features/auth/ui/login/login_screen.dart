import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/utils/injections.dart';
import '/shared/widgets/sizes.dart';
import 'bloc/login_bloc.dart';
import 'widgets/login_actions_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarBrightness: Brightness.light, // For iOS compatibility
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top], // Keep only the status bar visible
    );
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.white, // Transparent status bar
    //     systemNavigationBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark, // Black icons
    //     statusBarBrightness: Brightness.light, // For iOS compatibility
    //   ),
    // );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/im_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocProvider(
          create: (context) => LoginBloc(sl()),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0)
                    .copyWith(top: 75),
                child: Image.asset(
                  'assets/icons/ic_logo.png',
                  width: 70,
                ),
              ),
              const Height(4.0),
              Image.asset(
                'assets/images/im_logo.png',
                height: 32,
              ),
              const Height(75.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'auth.sign_in'.tr(),
                  style: GoogleFonts.inter(
                      color: const Color(0xFF120D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      height: 29.05 / 24.0),
                ),
              ),
              const Height(22.0),
              const LoginActionsField(),
            ],
          ),
        ),
      ),
    );
  }
}
