import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/features/movies/repositories/http_movie_repository.dart';
import 'package:movies_app/features/movies/repositories/movie_repository.dart';

void main() {
  test('movieRepositoryProvider is a HttpMovieRepository', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(movieRepositoryProvider),
      isA<HttpMovieRepository>(),
    );
  });
}
