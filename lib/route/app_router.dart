import 'package:auto_route/auto_route.dart';
import 'package:movies_app/navigation_home_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: NavigationHomePage, initial: true),
    // MaterialRoute(page: SignInPage, path: '/sign-in'),
  ],
  replaceInRouteName: 'Page,Route',
)

/// App router definition
class $AppRouter {}
