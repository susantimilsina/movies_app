import 'package:auto_route/auto_route.dart';
import 'package:movies_app/features/initial_screens/pages/intro_page.dart';
import 'package:movies_app/features/initial_screens/pages/navigation_home_page.dart';
import 'package:movies_app/features/initial_screens/pages/splash_page.dart';
import 'package:movies_app/features/movies/views/pages/movie_details_page.dart';
import 'package:movies_app/features/movies/views/pages/see_all_movie_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: NavigationHomePage, path: '/navigation-home',),
    MaterialRoute(page: SeeAllMoviePage, path: '/see-all-movie'),
    MaterialRoute(page: IntroPage, path: '/intro'),
    MaterialRoute(page: MovieDetailsPage, path: '/movie-details'),
  ],
  replaceInRouteName: 'Page,Route',
)

/// App router definition
class $AppRouter {}
