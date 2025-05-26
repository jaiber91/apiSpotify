import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_items_dto.freezed.dart';

@freezed
class SearchItemsDto with _$SearchItemsDto {
  const factory SearchItemsDto({
    required String id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required String type,
  }) = _SearchItemsDto;

  factory SearchItemsDto.fromApi(dynamic item, String type) {
    String id = item['id'] ?? '';
    String title = item['name'] ?? '';
    String subtitle = _parseSubtitle(item, type);
    String imageUrl = _parseImage(item, type);

    return SearchItemsDto(
      id: id,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      type: type,
    );
  }

  static String _parseSubtitle(dynamic item, String type) {
    if (type == 'track' || type == 'album') {
      final artists = item['artists'] as List? ?? [];
      return artists.map((a) => a['name']).join(', ');
    }
    return 'Artista';
  }

  static String _parseImage(dynamic item, String type) {
    final images = switch (type) {
      'track' => (item['album']?['images']) as List?,
      'album' || 'artist' => item['images'] as List?,
      _ => null,
    };

    if (images != null && images.isNotEmpty) {
      return images.first['url'] ?? '';
    }

    return '';
  }
}
