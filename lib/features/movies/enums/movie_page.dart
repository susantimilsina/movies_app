/// Enum to indicated Now Playing, Popular, or Top Rate Movies
enum MoviePage {
  /// Now Playing Movie Value
  nowPlaying,

  /// Popular Movie Value
  popular,

  /// Top Rated Movie Value
  topRated;


  /// String value from movie value
  String get toStr {
    switch (this) {
      case MoviePage.nowPlaying:
        return 'Now Playing';
      case MoviePage.popular:
        return 'Popular';
      case MoviePage.topRated:
        return 'Top Rated';
    }
  }
}
