// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/initial_screens/pages/intro_page.dart' as _i4;
import '../features/initial_screens/pages/navigation_home_page.dart' as _i2;
import '../features/initial_screens/pages/splash_page.dart' as _i1;
import '../features/movies/views/pages/movie_details_page.dart' as _i5;
import '../features/movies/views/pages/see_all_movie_page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    NavigationHomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.NavigationHomePage(),
      );
    },
    SeeAllMovieRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SeeAllMoviePage(),
      );
    },
    IntroRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.IntroPage(),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.MovieDetailsPage(
          movieName: args.movieName,
          movieId: args.movieId,
          backdropPath: args.backdropPath,
          posterPath: args.posterPath,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          NavigationHomeRoute.name,
          path: '/navigation-home',
        ),
        _i6.RouteConfig(
          SeeAllMovieRoute.name,
          path: '/see-all-movie',
        ),
        _i6.RouteConfig(
          IntroRoute.name,
          path: '/intro',
        ),
        _i6.RouteConfig(
          MovieDetailsRoute.name,
          path: '/movie-details',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.NavigationHomePage]
class NavigationHomeRoute extends _i6.PageRouteInfo<void> {
  const NavigationHomeRoute()
      : super(
          NavigationHomeRoute.name,
          path: '/navigation-home',
        );

  static const String name = 'NavigationHomeRoute';
}

/// generated route for
/// [_i3.SeeAllMoviePage]
class SeeAllMovieRoute extends _i6.PageRouteInfo<void> {
  const SeeAllMovieRoute()
      : super(
          SeeAllMovieRoute.name,
          path: '/see-all-movie',
        );

  static const String name = 'SeeAllMovieRoute';
}

/// generated route for
/// [_i4.IntroPage]
class IntroRoute extends _i6.PageRouteInfo<void> {
  const IntroRoute()
      : super(
          IntroRoute.name,
          path: '/intro',
        );

  static const String name = 'IntroRoute';
}

/// generated route for
/// [_i5.MovieDetailsPage]
class MovieDetailsRoute extends _i6.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    required String movieName,
    required int movieId,
    required String? backdropPath,
    required String? posterPath,
    _i7.Key? key,
  }) : super(
          MovieDetailsRoute.name,
          path: '/movie-details',
          args: MovieDetailsRouteArgs(
            movieName: movieName,
            movieId: movieId,
            backdropPath: backdropPath,
            posterPath: posterPath,
            key: key,
          ),
        );

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    required this.movieName,
    required this.movieId,
    required this.backdropPath,
    required this.posterPath,
    this.key,
  });

  final String movieName;

  final int movieId;

  final String? backdropPath;

  final String? posterPath;

  final _i7.Key? key;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{movieName: $movieName, movieId: $movieId, backdropPath: $backdropPath, posterPath: $posterPath, key: $key}';
  }
}
