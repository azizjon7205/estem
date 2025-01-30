// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:estem/features/auth/ui/login/login_screen.dart' as _i8;
import 'package:estem/features/auth/ui/verification/verification_screen.dart'
    as _i17;
import 'package:estem/features/create_survey/ui/pages/builder_screen.dart'
    as _i1;
import 'package:estem/features/create_survey/ui/pages/create_survey_screen.dart'
    as _i2;
import 'package:estem/features/main/main_screen.dart' as _i9;
import 'package:estem/features/main/ui/forms/ui/form_surveys/forms_screen.dart'
    as _i5;
import 'package:estem/features/main/ui/home/ui/home_screen.dart' as _i6;
import 'package:estem/features/main/ui/profile/bloc/profile_state.dart' as _i21;
import 'package:estem/features/main/ui/profile/ui/edit_interests_screen.dart'
    as _i3;
import 'package:estem/features/main/ui/profile/ui/edit_profile_screen.dart'
    as _i4;
import 'package:estem/features/main/ui/profile/ui/profile_screen.dart' as _i12;
import 'package:estem/features/main/ui/surveys/domain/entities/filter_params.dart'
    as _i24;
import 'package:estem/features/main/ui/surveys/ui/list/surveys_screen.dart'
    as _i15;
import 'package:estem/features/main/ui/wallet/ui/wallet_screen.dart' as _i18;
import 'package:estem/features/onboarding/ui/pages/language_screen.dart' as _i7;
import 'package:estem/features/onboarding/ui/pages/onboarding_screen.dart'
    as _i10;
import 'package:estem/features/placeholder_screen.dart' as _i11;
import 'package:estem/features/survey/ui/response/pages/survey_screen.dart'
    as _i14;
import 'package:estem/features/survey/ui/start/pages/start_survey_screen.dart'
    as _i13;
import 'package:estem/shared/models/question.dart' as _i23;
import 'package:estem/shared/models/survey.dart' as _i22;
import 'package:estem/test_app_screen.dart' as _i16;
import 'package:flutter/material.dart' as _i20;

/// generated route for
/// [_i1.BuilderScreen]
class BuilderRoute extends _i19.PageRouteInfo<void> {
  const BuilderRoute({List<_i19.PageRouteInfo>? children})
    : super(BuilderRoute.name, initialChildren: children);

  static const String name = 'BuilderRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.BuilderScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateSurveyScreen]
class CreateSurveyRoute extends _i19.PageRouteInfo<CreateSurveyRouteArgs> {
  CreateSurveyRoute({
    _i20.Key? key,
    dynamic id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         CreateSurveyRoute.name,
         args: CreateSurveyRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CreateSurveyRoute';

  static _i19.PageInfo page = _i19.PageInfo(
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

  final _i20.Key? key;

  final dynamic id;

  @override
  String toString() {
    return 'CreateSurveyRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.EditInterestsScreen]
class EditInterestsRoute extends _i19.PageRouteInfo<EditInterestsRouteArgs> {
  EditInterestsRoute({
    _i20.Key? key,
    required _i21.ProfileLoaded profileData,
    required List<String> initialInterests,
    required _i20.ValueChanged<List<String>> onSave,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         EditInterestsRoute.name,
         args: EditInterestsRouteArgs(
           key: key,
           profileData: profileData,
           initialInterests: initialInterests,
           onSave: onSave,
         ),
         initialChildren: children,
       );

  static const String name = 'EditInterestsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditInterestsRouteArgs>();
      return _i3.EditInterestsScreen(
        key: args.key,
        profileData: args.profileData,
        initialInterests: args.initialInterests,
        onSave: args.onSave,
      );
    },
  );
}

class EditInterestsRouteArgs {
  const EditInterestsRouteArgs({
    this.key,
    required this.profileData,
    required this.initialInterests,
    required this.onSave,
  });

  final _i20.Key? key;

  final _i21.ProfileLoaded profileData;

  final List<String> initialInterests;

  final _i20.ValueChanged<List<String>> onSave;

  @override
  String toString() {
    return 'EditInterestsRouteArgs{key: $key, profileData: $profileData, initialInterests: $initialInterests, onSave: $onSave}';
  }
}

/// generated route for
/// [_i4.EditProfileScreen]
class EditProfileRoute extends _i19.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    _i20.Key? key,
    required _i21.ProfileLoaded profileData,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         EditProfileRoute.name,
         args: EditProfileRouteArgs(key: key, profileData: profileData),
         initialChildren: children,
       );

  static const String name = 'EditProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return _i4.EditProfileScreen(
        key: args.key,
        profileData: args.profileData,
      );
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profileData});

  final _i20.Key? key;

  final _i21.ProfileLoaded profileData;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profileData: $profileData}';
  }
}

/// generated route for
/// [_i5.FormsScreen]
class FormsRoute extends _i19.PageRouteInfo<void> {
  const FormsRoute({List<_i19.PageRouteInfo>? children})
    : super(FormsRoute.name, initialChildren: children);

  static const String name = 'FormsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.FormsScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i20.Key? key,
    required Function openDrawer,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, openDrawer: openDrawer),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i6.HomeScreen(key: args.key, openDrawer: args.openDrawer);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.openDrawer});

  final _i20.Key? key;

  final Function openDrawer;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, openDrawer: $openDrawer}';
  }
}

/// generated route for
/// [_i7.LanguageScreen]
class LanguageRoute extends _i19.PageRouteInfo<void> {
  const LanguageRoute({List<_i19.PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.LanguageScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginScreen();
    },
  );
}

/// generated route for
/// [_i9.MainScreen]
class MainRoute extends _i19.PageRouteInfo<void> {
  const MainRoute({List<_i19.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.MainScreen();
    },
  );
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i19.PageRouteInfo<void> {
  const OnboardingRoute({List<_i19.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i11.PlaceholderScreen]
class PlaceholderRoute extends _i19.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i19.PageRouteInfo>? children})
    : super(PlaceholderRoute.name, initialChildren: children);

  static const String name = 'PlaceholderRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.PlaceholderScreen();
    },
  );
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i13.StartSurveyScreen]
class StartSurveyRoute extends _i19.PageRouteInfo<StartSurveyRouteArgs> {
  StartSurveyRoute({
    _i20.Key? key,
    _i22.Survey? survey,
    dynamic id = null,
    bool isFromPreview = false,
    _i20.VoidCallback? onStartSurvey,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<StartSurveyRouteArgs>(
        orElse:
            () => StartSurveyRouteArgs(id: queryParams.get('surveyId', null)),
      );
      return _i13.StartSurveyScreen(
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

  final _i20.Key? key;

  final _i22.Survey? survey;

  final dynamic id;

  final bool isFromPreview;

  final _i20.VoidCallback? onStartSurvey;

  @override
  String toString() {
    return 'StartSurveyRouteArgs{key: $key, survey: $survey, id: $id, isFromPreview: $isFromPreview, onStartSurvey: $onStartSurvey}';
  }
}

/// generated route for
/// [_i14.SurveyScreen]
class SurveyRoute extends _i19.PageRouteInfo<SurveyRouteArgs> {
  SurveyRoute({
    _i20.Key? key,
    dynamic id,
    List<_i23.Question> questions = const [],
    required String title,
    bool isFromPreview = false,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveyRouteArgs>();
      return _i14.SurveyScreen(
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

  final _i20.Key? key;

  final dynamic id;

  final List<_i23.Question> questions;

  final String title;

  final bool isFromPreview;

  @override
  String toString() {
    return 'SurveyRouteArgs{key: $key, id: $id, questions: $questions, title: $title, isFromPreview: $isFromPreview}';
  }
}

/// generated route for
/// [_i15.SurveysScreen]
class SurveysRoute extends _i19.PageRouteInfo<SurveysRouteArgs> {
  SurveysRoute({
    _i20.Key? key,
    required _i24.FilterParams params,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SurveysRoute.name,
         args: SurveysRouteArgs(key: key, params: params),
         initialChildren: children,
       );

  static const String name = 'SurveysRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurveysRouteArgs>();
      return _i15.SurveysScreen(key: args.key, params: args.params);
    },
  );
}

class SurveysRouteArgs {
  const SurveysRouteArgs({this.key, required this.params});

  final _i20.Key? key;

  final _i24.FilterParams params;

  @override
  String toString() {
    return 'SurveysRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [_i16.TestAppScreen]
class TestAppRoute extends _i19.PageRouteInfo<void> {
  const TestAppRoute({List<_i19.PageRouteInfo>? children})
    : super(TestAppRoute.name, initialChildren: children);

  static const String name = 'TestAppRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.TestAppScreen();
    },
  );
}

/// generated route for
/// [_i17.VerificationScreen]
class VerificationRoute extends _i19.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    _i20.Key? key,
    required String phoneNumber,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         VerificationRoute.name,
         args: VerificationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'VerificationRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationRouteArgs>();
      return _i17.VerificationScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.phoneNumber});

  final _i20.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i18.WalletScreen]
class WalletRoute extends _i19.PageRouteInfo<void> {
  const WalletRoute({List<_i19.PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.WalletScreen();
    },
  );
}
