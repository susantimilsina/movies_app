import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';

/// The PaginatedResponse class contains information about the total number of
/// pages and the total results in all pages along with a list of the
/// provided type
///
/// An example response from the API for any page looks like this:
/// {
///   "page": 1,
///   "results": [], // list of 20 items
///   "total_pages": 500,
///   "total_results": 10000 // Value taken by this provider
/// }
///

/// The provider that has the value of the total count of the
/// Popular Movie items
///
final popularMovieCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(paginatedPopularMovieProvider(0)).whenData(
        (PaginatedResponse<MovieModel> pageData) => pageData.totalResults,
      );
});

/// The provider that has the value of the total count of the
/// Now Playing Movie items
///
final nowplayingMovieCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(paginatedNowPlayingMovieProvider(0)).whenData(
        (PaginatedResponse<MovieModel> pageData) => pageData.totalResults,
      );
});

/// The provider that has the value of the total count of the
///  Top Rated Movie items
///
final topratedMovieCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(paginatedTopratedMovieProvider(0)).whenData(
        (PaginatedResponse<MovieModel> pageData) => pageData.totalResults,
      );
});
