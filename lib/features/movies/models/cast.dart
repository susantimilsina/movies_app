// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
/// Model for a cast's object
class Cast with _$Cast {
    /// Creates a new instance of [Cast]
    const factory Cast({
        int? gender,
        @JsonKey(name: 'known_for_department')  String? knownForDepartment,
        @JsonKey(name: 'original_name')  String? originalName,
        @JsonKey(name: 'profile_path')  String? profilePath,
        String? character,
    }) = _Cast;
  /// Creates a new instance of [Cast] from parsed raw data

    factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
}
