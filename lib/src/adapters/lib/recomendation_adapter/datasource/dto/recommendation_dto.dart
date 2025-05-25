import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_dto.freezed.dart';
part 'recommendation_dto.g.dart';

@freezed
class RecommendationDto with _$RecommendationDto {
  const factory RecommendationDto({
    required String id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required String type,
  }) = _RecommendationDto;

  factory RecommendationDto.fromJson(Map<String, dynamic> json) =>
      _$RecommendationDtoFromJson(json);
}
