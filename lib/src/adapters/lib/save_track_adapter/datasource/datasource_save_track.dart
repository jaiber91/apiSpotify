import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';

class DatasourceSaveTrack {
  final HttpService _http;

  DatasourceSaveTrack(this._http);

  Future<void> saveTracks(List<String> trackIds, String token) async {
    await _http.put(
      path: HttpPath.pathSaveTrack,
      queryParameters: {
        'ids': trackIds.join(','),
      },
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }
}
