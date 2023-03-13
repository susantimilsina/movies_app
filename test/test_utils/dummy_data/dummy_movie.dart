// ignore_for_file: lines_longer_than_80_chars

import 'package:movies_app/core/models/paginated_response.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';

class DummyMovie {
  static List<Map<String, dynamic>> rawMovies = [
    <String, dynamic>{
      'adult': false,
      'backdrop_path': '/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg',
      'genre_ids': [28, 12, 878],
      'id': 505642,
      'original_title': 'Black Panther: Wakanda Forever',
      'overview':
          'Queen Ramonda Shuri, M’ Baku,Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’ Challa’ s death.As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.',
      'popularity': 4378.531,
      'poster_path': '/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
      'release_date': '2022-11-09',
      'title': 'Black Panther: Wakanda Forever',
      'video': false,
      'vote_average': 7.4,
      'vote_count': 3337
    },
    {
      'adult': false,
      'backdrop_path': '/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg',
      'genre_ids': [16, 12, 35, 10751, 14],
      'id': 315162,
      'original_title': 'Puss in Boots: The Last Wish',
      'overview':
          'Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left.Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.',
      'popularity': 3204.321,
      'poster_path': '/kuf6dutpsT0vSVehic3EZIqkOBt.jpg',
      'release_date': '2022-12-07',
      'title': 'Puss in Boots: The Last Wish',
      'video': false,
      'vote_average': 8.5,
      'vote_count': 3877
    }
  ];
  static PaginatedResponse<MovieModel> paginatedMovieResponse =
      PaginatedResponse<MovieModel>(
    page: 1,
    results: movieList,
    totalPages: 500,
    totalResults: 1000,
  );

  static List<MovieModel> movieList = List<MovieModel>.from(
    rawMovies
        .map(
          MovieModel.fromJson,
        )
        .toList(),
  );

  static Map<String, dynamic> rawMovie = {
    'adult': false,
    'backdrop_path': '/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg',
    'genre_ids': [28, 12, 878],
    'id': 505642,
    'original_title': 'Black Panther: Wakanda Forever',
    'overview':
        'Queen Ramonda Shuri, M’ Baku,Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’ Challa’ s death.As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.',
    'popularity': 4378.531,
    'poster_path': '/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
    'release_date': '2022-11-09',
    'title': 'Black Panther: Wakanda Forever',
    'video': false,
    'vote_average': 7.4,
    'vote_count': 3337
  };

  static MovieModel singleMovie = MovieModel.fromJson(rawMovie);
}
