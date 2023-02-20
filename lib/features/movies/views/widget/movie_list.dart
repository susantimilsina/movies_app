import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/views/widget/movie_card.dart';

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
          return MovieCard(singleMovie: singleMovie,);
        },
        itemCount: movieList.length,
      ),
    );
  }
}
