import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/app_icon_data.dart';
import 'package:movies_app/core/configs/app_icons.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/route/app_router.gr.dart';

/// Initial Page of the app
class SplashPage extends StatefulWidget {
  /// Instance of [SplashPage]
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // ignore: inference_failure_on_instance_creation
    Future.delayed(const Duration(seconds: 3)).then((value) {
      context.router.replace(
        const IntroRoute(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
