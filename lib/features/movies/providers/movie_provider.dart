import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';
import 'package:movies_app/features/pagination/providers/pagination_provider.dart';
import 'package:movies_app/features/pagination/state/pagination_state.dart';

/// See All providers with respect to
final itemsProvider = StateNotifierProvider.autoDispose<
    PaginationProvider<MovieModel>, PaginationState<MovieModel>>((ref) {
  return PaginationProvider(
    itemsPerBatch: 20,
    fetchNextItems: (
      item,
    ) {
      final currentPageStatus = ref.watch(seeAllPageStatusProvider);
      switch (currentPageStatus) {
        case MoviePage.nowPlaying:
          return ref.read(movieRepositoryProvider).getNowPlayingMovies(
                page: item,
              );
        case MoviePage.popular:
          return ref.read(movieRepositoryProvider).getPopularMovies(
                page: item,
              );
        case MoviePage.topRated:
          return ref.read(movieRepositoryProvider).getTopRatedMovies(
                page: item,
              );
      }
    },
  )..init();
});

/// FutureProvider that fetches paginated now playing movie
final paginatedNowPlayingMovieProvider =
    FutureProvider.family<PaginatedResponse<MovieModel>, int>(
  (ref, int pageIndex) async {
    final movieRepository = ref.watch(movieRepositoryProvider);

    return movieRepository.getNowPlayingMovies(
      page: pageIndex + 1,
    );
  },
);

/// FutureProvider that fetches paginated now playing movie
final paginatedPopularMovieProvider =
    FutureProvider.family<PaginatedResponse<MovieModel>, int>(
  (ref, int pageIndex) async {
    final movieRepository = ref.watch(movieRepositoryProvider);

    return movieRepository.getPopularMovies(
      page: pageIndex + 1,
    );
  },
);

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
