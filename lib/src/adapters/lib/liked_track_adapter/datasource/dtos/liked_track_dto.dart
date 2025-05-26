import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_track_dto.freezed.dart';

@freezed
class LikedTrackDto with _$LikedTrackDto {
  const factory LikedTrackDto({
    required String id,
    required String name,
    required String artist,
    required String imageUrl,
    String? previewUrl,
  }) = _LikedTrackDto;

  factory LikedTrackDto.fromJson(Map<String, dynamic> json) {
    final track = json['track'] as Map<String, dynamic>? ?? {};

    final artists = (track['artists'] as List?)
            ?.map((a) => a['name'] as String?)
            .whereType<String>()
            .toList()
            .join(', ') ??
        '';

    final imageUrl = (track['album']?['images'] as List?)
        ?.cast<Map<String, dynamic>>()
        .firstWhere(
          (img) => img.containsKey('url'),
          orElse: () => {'url': ''},
        )['url'] as String;

    return LikedTrackDto(
      id: track['id'] ?? '',
      name: track['name'] ?? '',
      artist: artists,
      imageUrl: imageUrl,
      previewUrl: track['preview_url'],
    );
  }
}
