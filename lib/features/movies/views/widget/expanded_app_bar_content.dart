import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/styles/spacing_size.dart';
import 'package:movies_app/core/utils/tmdb_image_utils.dart';
import 'package:movies_app/core/widgets/app_cached_network_image.dart';

/// Contents in Top Bar Blurred Widget
class ExpandedAppBarContent extends StatelessWidget {
  /// Instance of [ExpandedAppBarContent]
  const ExpandedAppBarContent({
    required this.movieName,
    required this.backdropPath,
    super.key,
  });

  /// Movie Name/Title
  final String movieName;

  /// Backdrop Image of Movie
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacing.sizedBoxH_12(),
        SizedBox(
          width: 175,
          height: 250,
          child: Material(
            borderRadius: BorderRadius.circular(
              15,
            ),
            elevation: 7,
            clipBehavior: Clip.antiAlias,
            child: AppCachedNetworkImage(
              imageUrl: TmdbImageUtils.getMoviePosterUrl(
                backdropPath,
              ),
              customErrorWidget:
                  Image.asset('assets/images/placeholder-male.png'),
            ),
          ),
        ),
        Spacing.sizedBoxH_10(),
        Text(
          movieName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
