import 'package:flutter/material.dart';

/// Creates half filled icon
class HalfFilledIcon extends StatelessWidget {
  /// Instance of [HalfFilledIcon]
  const HalfFilledIcon({
    required this.icon,
    required this.size,
    required this.color,
    required this.percentage,
    super.key,
  });

  /// Defines the icon
  final IconData icon;

  /// Defines size of icon
  final double size;

  /// Defines color of icon
  final Color color;

  /// Defines filling part in icon
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: [0, percentage, percentage],
          colors: [color, color, color.withOpacity(0.3)],
        ).createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: size, color: Colors.white),
      ),
    );
  }
}
