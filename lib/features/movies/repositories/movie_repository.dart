import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/core/services/http/http_service_provider.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/repositories/http_movie_repository.dart';

/// Provider to map [HttpMovieRepository] implementation to
/// [MovieRepository] interface
final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final httpService = ref.watch(httpServiceProvider);

    return HttpMovieRepository(httpService);
  },
);

/// Movie repository interface
abstract class MovieRepository {
  /// TMDB Base endpoint path for movie requests
  ///
  /// See: https://developers.themoviedb.org/3/movie
  String get path;

  /// API Key used to authenticate TMDB requests
  ///
  /// See: https://developers.themoviedb.org/3/getting-started/introduction
  String get apiKey;

  /// Request to get a list of now playing movies from endpoint
  Future<PaginatedResponse<MovieModel>> getNowPlayingMovies({
    int page = 1,
    bool forceRefresh = false,
  });

  /// Request to get a list of popular movies from endpoint
  Future<PaginatedResponse<MovieModel>> getPopularMovies({
    int page = 1,
    bool forceRefresh = false,
  });

  /// Request to get a list of top rated movies from endpoint
  Future<PaginatedResponse<MovieModel>> getTopRatedMovies({
    int page = 1,
    bool forceRefresh = false,
  });

  /// Request to get a movie details endpoint
  Future<MovieModel> getMovieDetails(
    int movieId, {
    bool forceRefresh = false,
  });
}
