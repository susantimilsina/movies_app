import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/models/cast.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

/// Future provider that fetches a movie's cast list
/// from the movie's id

final movieCastsProvider = FutureProvider.family<List<Cast>, int>(
  (ref, movieId) async {
    final movieRepository = ref.watch(movieRepositoryProvider);

    return movieRepository.getMovieCasts(
      movieId,
    );
  },
);
