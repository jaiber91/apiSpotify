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
    if (seedArtists.isEmpty && seedTracks.isEmpty) {
      throw Exception('Debes proporcionar al menos un seed (artist o track)');
    }

    final queryParameters = <String, String>{
      'limit': '10',
    };

    if (seedArtists.isNotEmpty) {
      queryParameters['seed_artists'] = seedArtists.join(',');
    }

    if (seedTracks.isNotEmpty) {
      queryParameters['seed_tracks'] = seedTracks.join(',');
    }

    final response = await _http.get(
      path: HttpPath.pathrecommendations,
      queryParameters: queryParameters,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final List<dynamic> tracks = response.data['tracks'] ?? [];

    return tracks.map((track) => RecommendationDto.fromJson(track)).toList();
  }
}
