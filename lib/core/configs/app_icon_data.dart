import 'package:flutter/material.dart';

/// AppIcon Class used in total system
class AppIcon extends StatelessWidget {
  /// Instance of [AppIcon]
  const AppIcon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  });

  /// defines size of icon required
  final double size;

  ///  Instance of class [AppIconData],
  final AppIconData icon;

  /// defines the color of the icon
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          icon.imageIcon,
          height: size,
          width: size,
          color: color,
        ),
      ),
    );
  }
}

/// class to store app icon data
class AppIconData {
  /// Instance of [AppIconData]
  const AppIconData(this.imageIcon);

  /// Image Icon [Assets-URl]
  final String imageIcon;
}
