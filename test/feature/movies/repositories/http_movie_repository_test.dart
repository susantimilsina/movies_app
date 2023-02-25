import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/services/http/http_service.dart';
import '../../../test_utils/dummy_data/dummy_movie.dart';
import '../../../test_utils/mocks.dart';

void main() {
  final HttpService mockHttpService = MockHttpService();
  final httpPeopleRepository = MockHttpMovieRepository();

  test('fetches paginated now playing movies people', () async {
    const page = 1;
    when(
      () => mockHttpService.get(
        '${httpPeopleRepository.path}/now_playing',
        queryParameters: <String, dynamic>{
          'page': page,
          'api_key': '',
        },
      ),
    ).thenAnswer(
      (_) async => <String, dynamic>{
        'page': page,
        'results': DummyMovie.movieList,
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
}
