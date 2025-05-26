import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_track_dto.freezed.dart';
part 'liked_track_dto.g.dart';

@freezed
class LikedTrackDto with _$LikedTrackDto {
  const factory LikedTrackDto({
    required String id,
    required String name,
    required String artist,
    required String imageUrl,
    String? previewUrl,
  }) = _LikedTrackDto;

  factory LikedTrackDto.fromJson(Map<String, dynamic> json) =>
      _$LikedTrackDtoFromJson(json);
}
