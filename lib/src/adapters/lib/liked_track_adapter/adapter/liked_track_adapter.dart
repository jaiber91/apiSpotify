import 'package:adapters/liked_track_adapter/mapper/liked_track_mapper.dart';
import 'package:domain/liked_track/liked_track.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';

import '../datasource/liked_track_datasource.dart';

class LikedTracksAdapter implements LikedTrackOutPort {
  final LikedTracksDatasource _datasource;

  LikedTracksAdapter(this._datasource);

  @override
  Future<List<LikedTrack>> getLikedTracks(String token) async {
    final dtos = await _datasource.getLikedTracks(token);
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
