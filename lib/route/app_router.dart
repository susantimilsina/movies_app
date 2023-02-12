import 'package:auto_route/auto_route.dart';
import 'package:movies_app/navigation_home_page.dart';
import 'package:movies_app/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: NavigationHomePage, path: '/navigation-home'),
  ],
  replaceInRouteName: 'Page,Route',
)

/// App router definition
class $AppRouter {}
