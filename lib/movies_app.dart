import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/app_themes.dart';
import 'package:movies_app/route/app_router.gr.dart';

/// Main App Widget
class MoviesApp extends ConsumerWidget {
  /// Creates new instance of [MoviesApp]
  MoviesApp({super.key});

  ///Instance of [AppRouter] for routing initiation
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
