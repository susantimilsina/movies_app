import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

/// FutureProvider that fetches paginated now top rated movie
final paginatedTopratedMovieProvider =
    FutureProvider.family<PaginatedResponse<MovieModel>, int>(
  (ref, int pageIndex) async {
    final movieRepository = ref.watch(movieRepositoryProvider);

    return movieRepository.getTopRatedMovies(
      page: pageIndex + 1,
    );
  },
);
