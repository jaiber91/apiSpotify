import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';
import 'dto/search_items_dto.dart';

class SpotifySearchDatasource {
  final HttpService _http;

  SpotifySearchDatasource(this._http);

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

    void extract(
      String key,
      String Function(dynamic) titleFn,
      String Function(dynamic) subtitleFn,
      String Function(dynamic) imageFn,
      String Function(dynamic) idFn,
      String type,
    ) {
      final items = data[key]?['items'] ?? [];
      for (var item in items) {
        try {
          results.add(SearchItemsDto(
            id: idFn(item),
            title: titleFn(item),
            subtitle: subtitleFn(item),
            imageUrl: imageFn(item),
            type: type,
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
      (e) => e['id'] ?? '',
      'track',
    );

    extract(
      'albums',
      (e) => e['name'] ?? '',
      (e) => safeArtistName(e),
      (e) => safeImage(e),
      (e) => e['id'] ?? '',
      'album',
    );

    extract(
      'artists',
      (e) => e['name'] ?? '',
      (_) => 'Artista',
      (e) => safeImage(e),
      (e) => e['id'] ?? '',
      'artist',
    );

    return results;
  }
}
