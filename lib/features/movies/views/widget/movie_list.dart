import 'package:flutter/material.dart';
import 'package:movies_app/core/configs/enums/image_size.dart';
import 'package:movies_app/core/utils/tmdb_image_utils.dart';
import 'package:movies_app/core/widgets/app_cached_network_image.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';

/// Movies List Card For Movie Home Page
class MovieList extends StatelessWidget {
  /// Instance of [MovieList]
  const MovieList({required this.movieList, super.key});

  /// List of MovieModel to show
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final singleMovie = movieList[index];
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
                child: AppCachedNetworkImage(
                  imageUrl: TmdbImageUtils.getMoviePosterUrl(
                    singleMovie.posterPath ?? '',
                  ),
                  customErrorWidget:
                      Image.asset('assets/images/placeholder-male.png'),
                ),
              ),
            ),
          );
        },
        itemCount: movieList.length,
      ),
    );
  }
}
