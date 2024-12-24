import 'package:auto_route/auto_route.dart';
import 'package:estem/core/router/router.gr.dart';

AppRouter navController = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LanguageRoute.page, initial: false),
    AutoRoute(page: OnboardingRoute.page, initial: false),
    AutoRoute(page: LoginRoute.page, initial: false),
    AutoRoute(page: VerificationRoute.page, initial: true),
  ];
}