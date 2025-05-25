import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';
import 'dto/recommendation_dto.dart';

class RecommendationDatasource {
  final HttpService _http;

  RecommendationDatasource(this._http);

  Future<List<RecommendationDto>> getRecommendations({
    required List<String> seedArtists,
    required List<String> seedTracks,
    required String token,
  }) async {
    final response = await _http.get(
      path: HttpPath.pathrecommendations,
      queryParameters: {
        'seed_artists': seedArtists.join(','),
        'seed_tracks': seedTracks.join(','),
        'limit': '10',
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final List<dynamic> tracks = response.data['tracks'] ?? [];

    return tracks.map((track) {
      return RecommendationDto(
        id: track['id'] ?? '',
        title: track['name'] ?? '',
        subtitle: (track['artists'] as List).map((a) => a['name']).join(', '),
        imageUrl: track['album']?['images']?[0]?['url'] ?? '',
        type: track['type'] ?? '',
      );
    }).toList();
  }
}
