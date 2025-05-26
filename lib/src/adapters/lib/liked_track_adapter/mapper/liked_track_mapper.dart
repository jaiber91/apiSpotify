import '../datasource/dtos/liked_track_dto.dart';
import 'package:domain/liked_track/liked_track.dart';

extension LikedTrackMapper on LikedTrackDto {
  LikedTrack toDomain() {
    return LikedTrack(
      id: id,
      name: name,
      artist: artist,
      imageUrl: imageUrl,
      previewUrl: previewUrl,
    );
  }
}
