import 'package:movies_app/core/configs/configs.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/core/services/http/http_service.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

/// Http implementation of the [HttpMovieRepository]
class HttpMovieRepository implements MovieRepository {
  /// Creates a new instance of [HttpMovieRepository]
  HttpMovieRepository(this.httpService);

  /// Http service used to access an Http client and make calls
  final HttpService httpService;

  @override
  Future<PaginatedResponse<MovieModel>> getNowPlayingMovies({
    int page = 1,
    bool forceRefresh = false,
  }) async {
    final responseData = await httpService.get(
      '$path/now_playing',
      forceRefresh: forceRefresh,
      queryParameters: <String, dynamic>{
        'page': page,
        'api_key': apiKey,
      },
    );

    return PaginatedResponse.fromJson(
      responseData,
      results: List<MovieModel>.from(
        (responseData['results'] as List<dynamic>).map<MovieModel>(
          (dynamic x) => MovieModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  Future<PaginatedResponse<MovieModel>> getPopularMovies({
    int page = 1,
    bool forceRefresh = false,
  }) async {
    final responseData = await httpService.get(
      '$path/popular',
      forceRefresh: forceRefresh,
      queryParameters: <String, dynamic>{
        'page': page,
        'api_key': apiKey,
      },
    );

    return PaginatedResponse.fromJson(
      responseData,
      results: List<MovieModel>.from(
        (responseData['results'] as List<dynamic>).map<MovieModel>(
          (dynamic x) => MovieModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  Future<PaginatedResponse<MovieModel>> getTopRatedMovies({
    int page = 1,
    bool forceRefresh = false,
  }) async {
    final responseData = await httpService.get(
      '$path/top_rated',
      forceRefresh: forceRefresh,
      queryParameters: <String, dynamic>{
        'page': page,
        'api_key': apiKey,
      },
    );

    return PaginatedResponse.fromJson(
      responseData,
      results: List<MovieModel>.from(
        (responseData['results'] as List<dynamic>).map<MovieModel>(
          (dynamic x) => MovieModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  Future<MovieModel> getMovieDetails(
    int movieId, {
    bool forceRefresh = false,
  }) {
    throw UnimplementedError();
  }

  @override
  String get path => '/movie';

  @override
  String get apiKey => Configs.tmdbAPIKey;
  
}
