import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_dto.freezed.dart';

@freezed
class RecommendationDto with _$RecommendationDto {
  const factory RecommendationDto({
    required String id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required String type,
  }) = _RecommendationDto;

  factory RecommendationDto.fromJson(Map<String, dynamic> json) {
    final artists = (json['artists'] as List?)
            ?.map((a) => a['name'] as String?)
            .whereType<String>()
            .join(', ') ??
        '';

    final imageUrl = (json['album']?['images'] as List?)
        ?.cast<Map<String, dynamic>>()
        .firstWhere(
          (img) => img.containsKey('url'),
          orElse: () => {'url': ''},
        )['url'] as String;

    return RecommendationDto(
      id: json['id'] ?? '',
      title: json['name'] ?? '',
      subtitle: artists,
      imageUrl: imageUrl,
      type: json['type'] ?? '',
    );
  }
}
