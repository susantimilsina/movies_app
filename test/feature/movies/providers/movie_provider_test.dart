import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/movie_provider.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';
import '../../../test_utils/dummy_data/dummy_movie.dart';
import '../../../test_utils/mocks.dart';

void main() {
  final MovieRepository mockMovieRepository = MockMovieRepository();

  setUp(() {
    when(
      () => mockMovieRepository.getNowPlayingMovies(
        forceRefresh: false,
        page: 1,
      ),
    ).thenAnswer((_) async => DummyMovie.paginatedMovieResponse);
  });

  test('fetches now playing movies', () async {
    final nowPlayingMovieListener =
        Listener<AsyncValue<PaginatedResponse<MovieModel>>>();

    final providerContainer = ProviderContainer(
      overrides: [
        movieRepositoryProvider.overrideWithValue(mockMovieRepository),
      ],
    );

    // After test is run disposing the providers
    addTearDown(providerContainer.dispose);

    providerContainer.listen<AsyncValue<PaginatedResponse<MovieModel>>>(
      paginatedNowPlayingMovieProvider(0),
      nowPlayingMovieListener.call,
      fireImmediately: true,
    );

// Perform first reading, expects loading state
    final firstReading =
        providerContainer.read(paginatedNowPlayingMovieProvider(0));
    expect(
      firstReading,
      const AsyncValue<PaginatedResponse<MovieModel>>.loading(),
    );

    // Listener was fired from `null` to loading AsyncValue
    verify(
      () => nowPlayingMovieListener(
        null,
        const AsyncValue<PaginatedResponse<MovieModel>>.loading(),
      ),
    ).called(1);

    // Perform second reading, by waiting for the request, expects fetched data
    final secondReading = await providerContainer
        .read(paginatedNowPlayingMovieProvider(0).future);
    expect(secondReading, DummyMovie.paginatedMovieResponse);

    // Listener was fired from loading to fetched values
    verify(
      () => nowPlayingMovieListener(
        const AsyncValue<PaginatedResponse<MovieModel>>.loading(),
        AsyncValue<PaginatedResponse<MovieModel>>.data(
          DummyMovie.paginatedMovieResponse,
        ),
      ),
    ).called(1);

    // No more further listener events fired
    verifyNoMoreInteractions(nowPlayingMovieListener);
  });


}
