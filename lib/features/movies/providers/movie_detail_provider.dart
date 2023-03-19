import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

/// Future provider that fetches a movie's details
/// from the movie's id

final movieDetailsProvider = FutureProvider.family<MovieModel, int>(
  (ref, movieId) async {
    final movieRepository = ref.watch(movieRepositoryProvider);

    return movieRepository.getMovieDetails(
      movieId,
    );
  },
);
