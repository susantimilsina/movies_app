import 'package:flutter/material.dart';

///Customized Gradient Container
class GradientContainer extends StatelessWidget {
  /// Instance of [GradientContainer]
  const GradientContainer(
    this.colors,
    this.stops, {
    super.key,
    this.child,
    this.width,
    this.height,
    this.alignment,
    this.begin,
    this.end,
    this.blendMode,
    this.borderRadius,
  });

  /// List of colors for gradient
  final List<Color> colors;

  /// List of stops
  final List<double> stops;

  ///Container Width
  final double? width;

  /// Container Width
  final double? height;

  ///Child of the Container
  final Widget? child;

  /// Begin Alignment for gradient
  final Alignment? begin;

  /// Begin Alignment for gradient
  final Alignment? end;

  ///Alignment of container
  final Alignment? alignment;

  /// Color blend mode for Gradient
  final BlendMode? blendMode;

  /// Border radius of container
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin ?? Alignment.centerLeft,
              end: end ?? Alignment.centerRight,
              colors: colors,
              stops: stops,
            ),
            backgroundBlendMode: blendMode,
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      );
}

///Customized Horizontal Gradient Container
class HzGradient extends GradientContainer {
  /// Instance of [HzGradient]
  const HzGradient(
    super.colors,
    super.stops, {
    super.key,
    super.child,
    super.width,
    super.height,
    super.alignment,
    super.blendMode,
    super.borderRadius,
  });
}

///Customized Vertical Gradient Container
class VtGradient extends GradientContainer {
  /// Instance of [VtGradient]
  const VtGradient(
    super.colors,
    super.stops, {
    super.key,
    super.child,
    super.width,
    super.height,
    super.alignment,
    super.blendMode,
    super.borderRadius,
  }) : super(begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
