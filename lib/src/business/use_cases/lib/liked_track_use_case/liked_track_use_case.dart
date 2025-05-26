import 'package:domain/liked_track/liked_track.dart';
import 'package:in_ports/liked_track_in_port/liked_track_in_port.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';

class LikedTrackUseCase implements LikedTrackInPort {
  final LikedTrackOutPort _likedTrackOutPort;
  final SessionStorageOutPort _storage;

  LikedTrackUseCase(this._likedTrackOutPort, this._storage);

  @override
  Future<List<LikedTrack>> getLikedTracks() async {
    final token = await _storage.readToken();
    if (token == null) throw Exception('Token no disponible');
    return await _likedTrackOutPort.getLikedTracks(token);
  }
}
