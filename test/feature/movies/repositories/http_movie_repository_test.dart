import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/configs/configs.dart';
import 'package:movies_app/core/services/http/http_service.dart';
import 'package:movies_app/features/movies/repositories/http_movie_repository.dart';
import '../../../test_utils/dummy_data/dummy_movie.dart';
import '../../../test_utils/mocks.dart';

void main() {
  final HttpService mockHttpService = MockHttpService();
  final httpPeopleRepository = HttpMovieRepository(
    mockHttpService,
  );

  test('fetches paginated now playing movies people', () async {
    const page = 1;
    when(
      () => mockHttpService.get(
        '${httpPeopleRepository.path}/now_playing',
        queryParameters: <String, dynamic>{
          'page': page,
          'api_key': Configs.tmdbAPIKey,
        },
      ),
    ).thenAnswer(
      (_) async => <String, dynamic>{
        'page': page,
        'results': DummyMovie.rawMovies,
        'total_pages': 1,
        'total_results': 10,
      },
    );

    final paginatedPopularPeople =
        await httpPeopleRepository.getNowPlayingMovies(
      page: 1,
    );

    expect(
      paginatedPopularPeople.results,
      equals(DummyMovie.movieList),
    );
  });

  test('fetches paginated popular movies people', () async {
    const page = 1;
    when(
      () => mockHttpService.get(
        '${httpPeopleRepository.path}/popular',
        queryParameters: <String, dynamic>{
          'page': page,
          'api_key': Configs.tmdbAPIKey,
        },
      ),
    ).thenAnswer(
      (_) async => <String, dynamic>{
        'page': page,
        'results': DummyMovie.rawMovies,
        'total_pages': 1,
        'total_results': 10,
      },
    );

    final paginatedPopularPeople = await httpPeopleRepository.getPopularMovies(
      page: 1,
    );

    expect(
      paginatedPopularPeople.results,
      equals(DummyMovie.movieList),
    );
  });

  test('fetches paginated top popular movies people', () async {
    const page = 1;
    when(
      () => mockHttpService.get(
        '${httpPeopleRepository.path}/top_rated',
        queryParameters: <String, dynamic>{
          'page': page,
          'api_key': Configs.tmdbAPIKey,
        },
      ),
    ).thenAnswer(
      (_) async => <String, dynamic>{
        'page': page,
        'results': DummyMovie.rawMovies,
        'total_pages': 1,
        'total_results': 10,
      },
    );

    final paginatedPopularPeople = await httpPeopleRepository.getTopRatedMovies(
      page: 1,
    );

    expect(
      paginatedPopularPeople.results,
      equals(DummyMovie.movieList),
    );
  });
}
