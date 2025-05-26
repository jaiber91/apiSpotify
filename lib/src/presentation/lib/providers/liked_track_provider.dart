import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';
import 'package:in_ports/liked_track_in_port/liked_track_in_port.dart';
import 'package:domain/liked_track/liked_track.dart';

final likedTracksProvider = FutureProvider<List<LikedTrack>>((ref) async {
  final useCase = getIt<LikedTrackInPort>();
  return await useCase.getLikedTracks();
});
