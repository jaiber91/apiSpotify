import 'package:adapters/liked_track_adapter/datasource/dtos/liked_track_dto.dart';

import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';

class LikedTracksDatasource {
  final HttpService _http;

  LikedTracksDatasource(this._http);

  Future<List<LikedTrackDto>> getLikedTracks(String token) async {
    final response = await _http.get(
      path: HttpPath.pathTrack,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final items = (response.data['items'] as List?) ?? [];

    return items.map((item) => LikedTrackDto.fromJson(item)).toList();
  }
}
