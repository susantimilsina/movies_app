import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/configs/styles/app_colors.dart';
import 'package:movies_app/core/utils/tmdb_image_utils.dart';
import 'package:movies_app/core/widgets/app_cached_network_image.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';

/// Movie Card For Movie Home Page
class MovieCard extends ConsumerWidget {
  /// Instance of [MovieCard]
  const MovieCard({required this.singleMovie, super.key});

  /// Single Movie Item to show on card
  final MovieModel singleMovie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(
          //   context,
          //   MOVIE_DETAIL_ROUTE,
          //   arguments: movie.id,
          // );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: [
              AppCachedNetworkImage(
                imageUrl: TmdbImageUtils.getMoviePosterUrl(
                  singleMovie.posterPath ?? '',
                ),
                customErrorWidget:
                    Image.asset('assets/images/placeholder-male.png'),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    color: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    child: Text((singleMovie.voteAverage ?? 0.0).toString()),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
