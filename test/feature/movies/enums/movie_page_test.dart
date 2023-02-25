import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';

void main() {
  test('Movie Page enums is equivalent to its String', () {
    expect(MoviePage.nowPlaying.toStr, equals('Now Playing'));
    expect(MoviePage.popular.toStr, equals('Popular'));
  });
}
