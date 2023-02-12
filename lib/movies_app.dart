import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/app_themes.dart';
import 'package:movies_app/navigation_home_page.dart';

/// Main App Widget
class MoviesApp extends ConsumerWidget {
  /// Creates new instance of [MoviesApp]
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: NavigationHomePage(),
    );
  }
}
