// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationDtoImpl _$$RecommendationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$RecommendationDtoImplToJson(
        _$RecommendationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
    };
