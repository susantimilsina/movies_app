import 'package:movies_app/core/configs/configs.dart';
import 'package:movies_app/core/configs/enums/image_size.dart';

/// Different Level Image Configs
class TmdbImageUtils {
  /// Example output for [ImageSize.original]
  /// https://image.tmdb.org/t/p/original/14uxt0jH28J9zn4vNQNTae3Bmr7.jpg
  static String getMoviePosterUrl(
    String backdropPath, {
    ImageSize imageSize = ImageSize.original,
  }) {
    final imagePath =
        '${Configs.secureImageBaseUrl}${imageSize.name}$backdropPath';
    return imagePath;
  }
}
