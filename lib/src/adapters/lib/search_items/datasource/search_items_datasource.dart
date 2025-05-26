import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';
import 'dto/search_items_dto.dart';

class SearchDatasource {
  final HttpService _http;

  SearchDatasource(this._http);

  Future<List<SearchItemsDto>> search(String query, String token) async {
    final response = await _http.get(
      path: HttpPath.pathSearch,
      queryParameters: {
        'q': query,
        'type': 'track,album,artist',
        'limit': '10',
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final data = response.data;
    final List<SearchItemsDto> results = [];

    void extractItems(String key, String type) {
      final items = data[key]?['items'] as List? ?? [];
      for (var item in items) {
        try {
          results.add(SearchItemsDto.fromApi(item, type));
        } catch (e, stack) {
          print('Error mapeando $key: $e\n$stack');
        }
      }
    }

    extractItems('tracks', 'track');
    extractItems('albums', 'album');
    extractItems('artists', 'artist');

    return results;
  }
}
