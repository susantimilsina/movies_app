import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';
import 'package:movies_app/features/movies/providers/movie_count_provider.dart';
import 'package:movies_app/features/movies/providers/see_all_page_provider.dart';

///
final countProvider = Provider((ref) {
  final currentPageStatus = ref.watch(seeAllPageStatusProvider);
  switch (currentPageStatus) {
    case MoviePage.nowPlaying:
      return ref.watch(nowplayingMovieCountProvider);
    case MoviePage.popular:
      return ref.watch(popularMovieCountProvider);
    case MoviePage.topRated:
      return ref.watch(topratedMovieCountProvider);
  }
});


/// The provider that provides the MOVIE data for each list item
///
/// Initially it throws an UnimplementedError because we won't use it
/// before overriding it
///
final seeAllMovieProvider = Provider<AsyncValue<MovieModel>>((ref) {
  throw UnimplementedError();
});
