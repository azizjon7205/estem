// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:estem/features/auth/ui/login/login_screen.dart' as _i6;
import 'package:estem/features/auth/ui/verification/verification_screen.dart'
    as _i14;
import 'package:estem/features/create_survey/ui/pages/builder_screen.dart'
    as _i1;
import 'package:estem/features/create_survey/ui/pages/create_survey_screen.dart'
    as _i2;
import 'package:estem/features/main/home/ui/home_screen.dart' as _i4;
import 'package:estem/features/main/main_screen.dart' as _i7;
import 'package:estem/features/main/profile/ui/profile_screen.dart' as _i10;
import 'package:estem/features/main/ui/forms/ui/form_surveys/forms_screen.dart'
    as _i3;
import 'package:estem/features/main/ui/wallet/ui/wallet_screen.dart' as _i15;
import 'package:estem/features/onboarding/ui/pages/language_screen.dart' as _i5;
import 'package:estem/features/onboarding/ui/pages/onboarding_screen.dart'
    as _i8;
import 'package:estem/features/placeholder_screen.dart' as _i9;
import 'package:estem/features/survey/ui/response/pages/survey_screen.dart'
    as _i12;
import 'package:estem/features/survey/ui/start/pages/start_survey_screen.dart'
    as _i11;
import 'package:estem/shared/models/question.dart' as _i19;
import 'package:estem/shared/models/survey.dart' as _i18;
import 'package:estem/test_app_screen.dart' as _i13;
import 'package:flutter/material.dart' as _i17;

/// generated route for
/// [_i1.BuilderScreen]
class BuilderRoute extends _i16.PageRouteInfo<void> {
  const BuilderRoute({List<_i16.PageRouteInfo>? children})
    : super(BuilderRoute.name, initialChildren: children);

  static const String name = 'BuilderRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.BuilderScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateSurveyScreen]
class CreateSurveyRoute extends _i16.PageRouteInfo<CreateSurveyRouteArgs> {
  CreateSurveyRoute({
    _i17.Key? key,
    dynamic id,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         CreateSurveyRoute.name,
         args: CreateSurveyRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CreateSurveyRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateSurveyRouteArgs>(
        orElse: () => const CreateSurveyRouteArgs(),
      );
      return _i2.CreateSurveyScreen(key: args.key, id: args.id);
    },
  );
}

class CreateSurveyRouteArgs {
  const CreateSurveyRouteArgs({this.key, this.id});

  final _i17.Key? key;

  final dynamic id;

  @override
  String toString() {
    return 'CreateSurveyRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.FormsScreen]
class FormsRoute extends _i16.PageRouteInfo<void> {
  const FormsRoute({List<_i16.PageRouteInfo>? children})
    : super(FormsRoute.name, initialChildren: children);

  static const String name = 'FormsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.FormsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i17.Key? key,
    required Function openDrawer,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, openDrawer: openDrawer),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i4.HomeScreen(key: args.key, openDrawer: args.openDrawer);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.openDrawer});

  final _i17.Key? key;

  final Function openDrawer;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, openDrawer: $openDrawer}';
  }
}

/// generated route for
/// [_i5.LanguageScreen]
class LanguageRoute extends _i16.PageRouteInfo<void> {
  const LanguageRoute({List<_i16.PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.LanguageScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainScreen();
    },
  );
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingRoute extends _i16.PageRouteInfo<void> {
  const OnboardingRoute({List<_i16.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i9.PlaceholderScreen]
class PlaceholderRoute extends _i16.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i16.PageRouteInfo>? children})
    : super(PlaceholderRoute.name, initialChildren: children);

  static const String name = 'PlaceholderRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.PlaceholderScreen();
    },
  );
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i11.StartSurveyScreen]
class StartSurveyRoute extends _i16.PageRouteInfo<StartSurveyRouteArgs> {
  StartSurveyRoute({
    _i17.Key? key,
    _i18.Survey? survey,
    dynamic id = null,
    bool isFromPreview = false,
    _i17.VoidCallback? onStartSurvey,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         StartSurveyRoute.name,
         args: StartSurveyRouteArgs(
           key: key,
           survey: survey,
           id: id,
           isFromPreview: isFromPreview,
           onStartSurvey: onStartSurvey,
         ),
         rawQueryParams: {'surveyId': id},
         initialChildren: children,
       );

  static const String name = 'StartSurveyRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<StartSurveyRouteArgs>(
        orElse:
            () => StartSurveyRouteArgs(id: queryParams.get('surveyId', null)),
      );
      return _i11.StartSurveyScreen(
        key: args.key,
        survey: args.survey,
        id: args.id,
        isFromPreview: args.isFromPreview,
        onStartSurvey: args.onStartSurvey,
      );
    },
  );
}

class StartSurveyRouteArgs {
  const StartSurveyRouteArgs({
    this.key,
    this.survey,
    this.id = null,
    this.isFromPreview = false,
    this.onStartSurvey,
  });

  final _i17.Key? key;

  final _i18.Survey? survey;

  final dynamic id;

  final bool isFromPreview;

  final _i17.VoidCallback? onStartSurvey;

  @override
  String toString() {
    return 'StartSurveyRouteArgs{key: $key, survey: $survey, id: $id, isFromPreview: $isFromPreview, onStartSurvey: $onStartSurvey}';
  }
}

/// generated route for
/// [_i12.SurveyScreen]
class SurveyRoute extends _i16.PageRouteInfo<SurveyRouteArgs> {
  SurveyRoute({
    _i17.Key? key,
    dynamic id,
    List<_i19.Question> questions = const [],
    required String title,
    bool isFromPreview = false,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         SurveyRoute.name,
         args: SurveyRouteArgs(
           key: key,
           id: id,
           questions: questions,
           title: title,
           isFromPreview: isFromPreview,
         ),
         initialChildren: children,
       );

  static const String name = 'SurveyRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyRouteArgs>();
      return _i12.SurveyScreen(
        key: args.key,
        id: args.id,
        questions: args.questions,
        title: args.title,
        isFromPreview: args.isFromPreview,
      );
    },
  );
}

class SurveyRouteArgs {
  const SurveyRouteArgs({
    this.key,
    this.id,
    this.questions = const [],
    required this.title,
    this.isFromPreview = false,
  });

  final _i17.Key? key;

  final dynamic id;

  final List<_i19.Question> questions;

  final String title;

  final bool isFromPreview;

  @override
  String toString() {
    return 'SurveyRouteArgs{key: $key, id: $id, questions: $questions, title: $title, isFromPreview: $isFromPreview}';
  }
}

/// generated route for
/// [_i13.TestAppScreen]
class TestAppRoute extends _i16.PageRouteInfo<void> {
  const TestAppRoute({List<_i16.PageRouteInfo>? children})
    : super(TestAppRoute.name, initialChildren: children);

  static const String name = 'TestAppRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.TestAppScreen();
    },
  );
}

/// generated route for
/// [_i14.VerificationScreen]
class VerificationRoute extends _i16.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i17.Key? key,
    required String phoneNumber,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i14.VerificationScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.phoneNumber});

  final _i17.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i15.WalletScreen]
class WalletRoute extends _i16.PageRouteInfo<void> {
  const WalletRoute({List<_i16.PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.WalletScreen();
    },
  );
}
