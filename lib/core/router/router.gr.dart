// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:estem/features/auth/ui/login/login_screen.dart' as _i6;
import 'package:estem/features/auth/ui/verification/verification_screen.dart'
    as _i11;
import 'package:estem/features/home/forms/ui/forms_screen.dart' as _i3;
import 'package:estem/features/home/main/ui/home_screen.dart' as _i4;
import 'package:estem/features/home/main_screen.dart' as _i7;
import 'package:estem/features/home/profile/bloc/profile_state.dart' as _i15;
import 'package:estem/features/home/profile/ui/edit_interests_screen.dart'
    as _i1;
import 'package:estem/features/home/profile/ui/edit_profile_screen.dart' as _i2;
import 'package:estem/features/home/profile/ui/profile_screen.dart' as _i10;
import 'package:estem/features/home/wallet/ui/wallet_screen.dart' as _i12;
import 'package:estem/features/onboarding/ui/pages/language_screen.dart' as _i5;
import 'package:estem/features/onboarding/ui/pages/onboarding_screen.dart'
    as _i8;
import 'package:estem/features/placeholder_screen.dart' as _i9;
import 'package:flutter/material.dart' as _i14;

/// generated route for
/// [_i1.EditInterestsBottomSheet]
class EditInterestsBottomSheet
    extends _i13.PageRouteInfo<EditInterestsBottomSheetArgs> {
  EditInterestsBottomSheet({
    _i14.Key? key,
    required _i15.ProfileLoaded profileData,
    required List<String> initialInterests,
    required _i14.ValueChanged<List<String>> onSave,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          EditInterestsBottomSheet.name,
          args: EditInterestsBottomSheetArgs(
            key: key,
            profileData: profileData,
            initialInterests: initialInterests,
            onSave: onSave,
          ),
          initialChildren: children,
        );

  static const String name = 'EditInterestsBottomSheet';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditInterestsBottomSheetArgs>();
      return _i1.EditInterestsScreen(
        key: args.key,
        profileData: args.profileData,
        initialInterests: args.initialInterests,
        onSave: args.onSave,
      );
    },
  );
}

class EditInterestsBottomSheetArgs {
  const EditInterestsBottomSheetArgs({
    this.key,
    required this.profileData,
    required this.initialInterests,
    required this.onSave,
  });

  final _i14.Key? key;

  final _i15.ProfileLoaded profileData;

  final List<String> initialInterests;

  final _i14.ValueChanged<List<String>> onSave;

  @override
  String toString() {
    return 'EditInterestsBottomSheetArgs{key: $key, profileData: $profileData, initialInterests: $initialInterests, onSave: $onSave}';
  }
}

/// generated route for
/// [_i2.EditProfileScreen]
class EditProfileRoute extends _i13.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    _i14.Key? key,
    required _i15.ProfileLoaded profileData,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            profileData: profileData,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return _i2.EditProfileScreen(
        key: args.key,
        profileData: args.profileData,
      );
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.profileData,
  });

  final _i14.Key? key;

  final _i15.ProfileLoaded profileData;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profileData: $profileData}';
  }
}

/// generated route for
/// [_i3.FormsScreen]
class FormsRoute extends _i13.PageRouteInfo<void> {
  const FormsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.FormsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i14.Key? key,
    required Function openDrawer,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            openDrawer: openDrawer,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i4.HomeScreen(
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

  final _i14.Key? key;

  final Function openDrawer;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, openDrawer: $openDrawer}';
  }
}

/// generated route for
/// [_i5.LanguageScreen]
class LanguageRoute extends _i13.PageRouteInfo<void> {
  const LanguageRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.LanguageScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainScreen();
    },
  );
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i9.PlaceholderScreen]
class PlaceholderRoute extends _i13.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PlaceholderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceholderRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.PlaceholderScreen();
    },
  );
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i11.VerificationScreen]
class VerificationRoute extends _i13.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i14.Key? key,
    required String phoneNumber,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i11.VerificationScreen(
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

  final _i14.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i12.WalletScreen]
class WalletRoute extends _i13.PageRouteInfo<void> {
  const WalletRoute({List<_i13.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.WalletScreen();
    },
  );
}
