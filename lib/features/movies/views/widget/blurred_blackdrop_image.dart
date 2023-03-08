import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/tmdb_image_utils.dart';

/// Blurred Top Bar for Movie Details Page
class BlurredBackdropImage extends StatelessWidget {
  /// Instance of [BlurredBackdropImage]
  const BlurredBackdropImage({
    required this.backdropPath,
    super.key,
  });

  /// Movie backdropImage Path
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            TmdbImageUtils.getMoviePosterUrl(
              backdropPath,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
    );
  }
}
