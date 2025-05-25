import 'package:in_ports/save_track_in_port/save_track_in_port.dart';
import 'package:out_ports/save_track_out_port/save_track_out_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';

class SaveTrackUseCase implements SaveTrackInPort {
  final SaveTrackOutPort _saveTrackOutPort;
  final SessionStorageOutPort _sessionStorage;

  SaveTrackUseCase(this._saveTrackOutPort, this._sessionStorage);

  @override
  Future<void> saveTracks(List<String> trackIds) async {
    final token = await _sessionStorage.readToken();
    if (token == null) throw Exception('Token no disponible');
    await _saveTrackOutPort.saveTracks(trackIds, token);
  }
}
