// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:estem/features/auth/ui/login/login_screen.dart' as _i4;
import 'package:estem/features/auth/ui/verification/verification_screen.dart'
    as _i9;
import 'package:estem/features/home/forms/ui/forms_screen.dart' as _i1;
import 'package:estem/features/home/main/ui/home_screen.dart' as _i2;
import 'package:estem/features/home/main_screen.dart' as _i5;
import 'package:estem/features/home/profile/ui/profile_screen.dart' as _i8;
import 'package:estem/features/home/wallet/ui/wallet_screen.dart' as _i10;
import 'package:estem/features/onboarding/ui/pages/language_screen.dart' as _i3;
import 'package:estem/features/onboarding/ui/pages/onboarding_screen.dart'
    as _i6;
import 'package:estem/features/placeholder_screen.dart' as _i7;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.FormsScreen]
class FormsRoute extends _i11.PageRouteInfo<void> {
  const FormsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.FormsScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i12.Key? key,
    required Function openDrawer,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            openDrawer: openDrawer,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i2.HomeScreen(
        key: args.key,
        openDrawer: args.openDrawer,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.openDrawer,
  });

  final _i12.Key? key;

  final Function openDrawer;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, openDrawer: $openDrawer}';
  }
}

/// generated route for
/// [_i3.LanguageScreen]
class LanguageRoute extends _i11.PageRouteInfo<void> {
  const LanguageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.LanguageScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i7.PlaceholderScreen]
class PlaceholderRoute extends _i11.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PlaceholderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceholderRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.PlaceholderScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.VerificationScreen]
class VerificationRoute extends _i11.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i12.Key? key,
    required String phoneNumber,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i9.VerificationScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i12.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i10.WalletScreen]
class WalletRoute extends _i11.PageRouteInfo<void> {
  const WalletRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.WalletScreen();
    },
  );
}
