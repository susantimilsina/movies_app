// use_setters_to_change_properties
// ignore_for_file: use_setters_to_change_properties

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/movies/enums/movie_page.dart';

/// The provider that provides the current state movie page
final seeAllPageStatusProvider =
    StateNotifierProvider<SeeAllPageProvider, MoviePage>(
  (ref) => SeeAllPageProvider(),
);

/// The provider that manages the current state movie page
///
class SeeAllPageProvider extends StateNotifier<MoviePage> {
  /// Instance Of [SeeAllPageProvider]
  SeeAllPageProvider() : super(MoviePage.nowPlaying);

  /// changes the page status of the state
  void changePage(MoviePage page) {
    state = page;
  }
}
