import '../../shared/http/http_service.dart';
import 'dto/search_items_dto.dart';

class SpotifySearchDatasource {
  final HttpService _http;

  SpotifySearchDatasource(this._http);

  Future<List<SearchItemsDto>> search(String query, String token) async {
    final response = await _http.get(
      path: '/v1/search',
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

    void extract(
      String key,
      String Function(dynamic) titleFn,
      String Function(dynamic) subtitleFn,
      String Function(dynamic) imageFn,
    ) {
      final items = data[key]?['items'] ?? [];
      for (var item in items) {
        try {
          results.add(SearchItemsDto(
            title: titleFn(item),
            subtitle: subtitleFn(item),
            imageUrl: imageFn(item),
          ));
        } catch (e, stack) {
          print('❌ Error mapeando $key: $e\n$stack');
        }
      }
    }

    String safeArtistName(dynamic e) {
      final artists = e['artists'];
      if (artists is List && artists.isNotEmpty) {
        return (artists).map((a) => a['name']).join(', ');
      }
      return '';
    }

    String safeImage(dynamic e, [String path = 'images']) {
      final images = e[path];
      if (images is List && images.isNotEmpty) {
        return images.first['url'] ?? '';
      }
      return '';
    }

    extract(
      'tracks',
      (e) => e['name'] ?? '',
      (e) => safeArtistName(e),
      (e) => safeImage(e['album'] ?? {}),
    );

    extract(
      'albums',
      (e) => e['name'] ?? '',
      (e) => safeArtistName(e),
      (e) => safeImage(e),
    );

    extract(
      'artists',
      (e) => e['name'] ?? '',
      (_) => 'Artista',
      (e) => safeImage(e),
    );

    return results;
  }
}
