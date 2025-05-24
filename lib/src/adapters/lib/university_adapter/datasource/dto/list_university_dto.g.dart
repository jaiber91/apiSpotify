// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_university_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListUniversityDtoImpl _$$ListUniversityDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ListUniversityDtoImpl(
      alphaTwoCode: json['alpha_two_code'] as String,
      domains:
          (json['domains'] as List<dynamic>).map((e) => e as String).toList(),
      country: json['country'] as String,
      stateProvince: json['state-province'] as String?,
      webPages:
          (json['web_pages'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ListUniversityDtoImplToJson(
        _$ListUniversityDtoImpl instance) =>
    <String, dynamic>{
      'alpha_two_code': instance.alphaTwoCode,
      'domains': instance.domains,
      'country': instance.country,
      'state-province': instance.stateProvince,
      'web_pages': instance.webPages,
      'name': instance.name,
    };
