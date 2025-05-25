import 'package:domain/search_items/search_items.dart';

import '../datasource/dto/recommendation_dto.dart';

extension RecommendationMapper on RecommendationDto {
  SearchItems toDomain() {
    return SearchItems(
      id: id,
      title: title,
      subtitle: subtitle,
      imageUrl: imageUrl,
      type: type,
    );
  }
}
