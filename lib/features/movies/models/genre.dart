import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed

/// Model for a genre's object
class Genre with _$Genre {
  /// Creates a new instance of [Genre]
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  /// Creates a new instance of [Genre] from parsed raw data
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
