import 'package:domain/liked_track/liked_track.dart';

abstract class LikedTrackOutPort {
  Future<List<LikedTrack>> getLikedTracks(String token);
}
