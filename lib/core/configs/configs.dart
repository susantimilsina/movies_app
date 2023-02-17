/// App level configuration variables
class Configs {
  /// The max allowed age duration for the http cache
  static const Duration maxCacheAge = Duration(hours: 1);

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';

  /// Base API URL of The TMDB API
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';

  /// Base Image URL of The TMDB
  static const String secureImageBaseUrl = 'https://image.tmdb.org/t/p/';

  /// API Key registered with The TMDB API
  static const String tmdbAPIKey = '03e6071210f39ddc62dc9bf9f86b86b4';
  // static String tmdbAPIKey = dotenv.env['TMDB_KEY'] ?? '';
}
