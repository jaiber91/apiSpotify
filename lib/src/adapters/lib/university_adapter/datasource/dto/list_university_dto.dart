import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_university_dto.freezed.dart';
part 'list_university_dto.g.dart';

@freezed
class ListUniversityDto with _$ListUniversityDto {
  const factory ListUniversityDto({
    @JsonKey(name: 'alpha_two_code') required String alphaTwoCode,
    required List<String> domains,
    required String country,
    @JsonKey(name: 'state-province') String? stateProvince,
    @JsonKey(name: 'web_pages') required List<String> webPages,
    required String name,
  }) = _ListUniversityDto;

  factory ListUniversityDto.fromJson(Map<String, dynamic> json) =>
      _$ListUniversityDtoFromJson(json);
}
