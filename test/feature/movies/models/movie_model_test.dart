import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';

void main() {
  final rawExampleMovie = <String, dynamic>{
    'adult': false,
    'backdrop_path': '/pketzKFjq5TERXoXFM3L0OYRCLe.jpg',
    'genre_ids': jsonDecode('[16, 10751]'),
    'id': 599019,
    'original_title': 'Большое путешествие.Специальная доставка',
    'overview':
        'It has been a year since Mic Mic and Oscar returned from their incredible adventure.And now,after a diabolical plan by Vulture to sabotage the delivery of the Grizzly cub to his opponent in the American presidential elections,Mic Mic,Oscar,Panda teenager and Stork set off on another great adventure as they ride a zeppelin toreturn little Grizzly to its rightful parents and save the American elections and the whole continent from an erupting volcano.',
    'popularity': 652.507,
    'poster_path': '/dabXVfrAFfhDte8XVemom3mTJog.jpg',
    // 'release_date': '2022-10-07',
    'release_date': null,
    'title': 'Big Trip 2: Special Delivery',
    'video': false,
    'vote_average': 6.4,
    'vote_count': 9
  };

  final exampleMovie = MovieModel(
      adult: false,
      backdropPath: '/pketzKFjq5TERXoXFM3L0OYRCLe.jpg',
      genreIds: [16, 10751],
      id: 599019,
      originalTitle: 'Большое путешествие.Специальная доставка',
      overview:
          'It has been a year since Mic Mic and Oscar returned from their incredible adventure.And now,after a diabolical plan by Vulture to sabotage the delivery of the Grizzly cub to his opponent in the American presidential elections,Mic Mic,Oscar,Panda teenager and Stork set off on another great adventure as they ride a zeppelin toreturn little Grizzly to its rightful parents and save the American elections and the whole continent from an erupting volcano.',
      popularity: 652.507,
      posterPath: '/dabXVfrAFfhDte8XVemom3mTJog.jpg',
      // releaseDate: DateTime(2022, 10, 07),
      title: 'Big Trip 2: Special Delivery',
      video: false,
      voteAverage: 6.4,
      voteCount: 9);

  test('can parse data fromJson', () {
    expect(MovieModel.fromJson(rawExampleMovie), equals(exampleMovie));
  });

  test('can convert data toJson', () {
    expect(exampleMovie.toJson(), equals(rawExampleMovie));
  });

  test('returns null dates for invalid formats', () {
    final invalidDateExamplePerson = <String, dynamic>{
      ...rawExampleMovie,
      'release_date': null,
      'popularity': 20,
    };

    expect(MovieModel.fromJson(invalidDateExamplePerson).releaseDate, isNull);
    expect(MovieModel.fromJson(invalidDateExamplePerson).popularity, 20.0);
  });
}
