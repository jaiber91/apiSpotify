import 'package:out_ports/save_track_out_port/save_track_out_port.dart';

import '../datasource/datasource_save_track.dart';

class SaveTrackAdapter implements SaveTrackOutPort {
  final DatasourceSaveTrack _datasourceSaveTrack;

  SaveTrackAdapter(this._datasourceSaveTrack);
  @override
  Future<void> saveTracks(List<String> trackIds, String token) {
    return _datasourceSaveTrack.saveTracks(trackIds, token);
  }
}
