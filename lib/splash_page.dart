import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/app_icon_data.dart';
import 'package:movies_app/core/configs/app_icons.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';

/// Initial Page of the app
class SplashPage extends StatelessWidget {
  /// Instance of [SplashPage]
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const AppIcon(
                icon: AppIcons.netflixIcon,
                size: 150,
              ),
               Spacing.sizedBoxH_36(),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
