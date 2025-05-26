// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikedTrackDtoImpl _$$LikedTrackDtoImplFromJson(Map<String, dynamic> json) =>
    _$LikedTrackDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      artist: json['artist'] as String,
      imageUrl: json['imageUrl'] as String,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$$LikedTrackDtoImplToJson(_$LikedTrackDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'imageUrl': instance.imageUrl,
      'previewUrl': instance.previewUrl,
    };
