import 'package:auto_route/auto_route.dart';
import 'package:estem/core/router/router.gr.dart';
import 'package:estem/shared/data/data_sources/local/app_shared_prefs.dart';

import '../utils/injections.dart';

AppRouter navController = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TestAppRoute.page, initial: false),
        AutoRoute(page: MainRoute.page, initial: true, guards: [
          AuthenticationGuard()
        ], children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: FormsRoute.page),
          AutoRoute(page: PlaceholderRoute.page),
          AutoRoute(page: WalletRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
        AutoRoute(page: LanguageRoute.page, initial: false),
        AutoRoute(page: OnboardingRoute.page, initial: false),
        AutoRoute(
            page: LoginRoute.page, initial: false, guards: [OnboardingGuard()]),
        AutoRoute(page: VerificationRoute.page, initial: false),
        AutoRoute(page: StartSurveyRoute.page, path: '/survey', initial: false),
        AutoRoute(page: SurveyRoute.page, initial: false),
        AutoRoute(page: CreateSurveyRoute.page, initial: false, children: [
          AutoRoute(page: BuilderRoute.page, initial: true),
          AutoRoute(page: StartSurveyRoute.page, initial: false),
          AutoRoute(page: SurveyRoute.page, initial: false),
        ]),
      ];
        AutoRoute(page: EditProfileRoute.page, initial: false),
        AutoRoute(page: EditInterestsBottomSheet.page, initial: false)
  ];
}

class OnboardingGuard extends AutoRouteGuard {
  final AppSharedPrefs prefs = sl();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (prefs.getOnboardingComplete() != true) {
      navController.push(const LanguageRoute());
    } else {
      resolver.next(true);
    }
  }
}

class AuthenticationGuard extends AutoRouteGuard {
  final AppSharedPrefs prefs = sl();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (prefs.getPhoneNumber() == null) {
      navController.push(const LoginRoute());
    } else {
      resolver.next(true);
    }
  }
}
