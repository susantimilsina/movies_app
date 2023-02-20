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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/movies/views/pages/see_all_movie_page.dart' as _i3;
import '../navigation_home_page.dart' as _i2;
import '../splash_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    NavigationHomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.NavigationHomePage(),
      );
    },
    SeeAllMovieRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SeeAllMoviePage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          NavigationHomeRoute.name,
          path: '/navigation-home',
        ),
        _i4.RouteConfig(
          SeeAllMovieRoute.name,
          path: '/see-all-movie',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.NavigationHomePage]
class NavigationHomeRoute extends _i4.PageRouteInfo<void> {
  const NavigationHomeRoute()
      : super(
          NavigationHomeRoute.name,
          path: '/navigation-home',
        );

  static const String name = 'NavigationHomeRoute';
}

/// generated route for
/// [_i3.SeeAllMoviePage]
class SeeAllMovieRoute extends _i4.PageRouteInfo<void> {
  const SeeAllMovieRoute()
      : super(
          SeeAllMovieRoute.name,
          path: '/see-all-movie',
        );

  static const String name = 'SeeAllMovieRoute';
}
