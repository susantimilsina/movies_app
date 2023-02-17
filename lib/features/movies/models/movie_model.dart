// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed

/// Model for a movie's object
class MovieModel with _$MovieModel {
  /// Creates a new instance of [MovieModel]
  const factory MovieModel({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _MovieModel;

  /// Creates a new instance of [MovieModel] from parsed raw data
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
