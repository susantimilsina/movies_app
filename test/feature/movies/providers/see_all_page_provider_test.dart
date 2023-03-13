import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';

void main() {
  test('has the correst state in provider', () async {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    final currentState = providerContainer.read(seeAllPageStatusProvider);

    expect(
      currentState,
      equals(MoviePage.nowPlaying),
    );

    providerContainer
        .read(seeAllPageStatusProvider.notifier)
        .changePage(MoviePage.topRated);

    final nextState = providerContainer.read(seeAllPageStatusProvider);

    expect(
      nextState,
      equals(MoviePage.topRated),
    );
  });
}
