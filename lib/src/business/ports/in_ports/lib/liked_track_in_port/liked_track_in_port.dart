import 'package:domain/liked_track/liked_track.dart';

abstract class LikedTrackInPort {
  Future<List<LikedTrack>> getLikedTracks();
}
