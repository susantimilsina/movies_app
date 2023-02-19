import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/models/movie_model.dart';

/// The provider that provides the NOW PLAYING MOVIE data for each list item
///
/// Initially it throws an UnimplementedError because we won't use it
/// before overriding it
///
final currentNowPlayingMovieProvider = Provider<AsyncValue<MovieModel>>((ref) {
  throw UnimplementedError();
});
