import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
/// Model for a cast's object
class Cast with _$Cast {
    /// Creates a new instance of [Cast]
    const factory Cast({
        required int gender,
        required String knownForDepartment,
        required String originalName,
        required String profilePath,
        required String character,
    }) = _Cast;
  /// Creates a new instance of [Cast] from parsed raw data

    factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
