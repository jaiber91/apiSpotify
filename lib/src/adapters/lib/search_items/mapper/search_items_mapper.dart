import 'package:domain/search_items/search_items.dart';

import '../datasource/dto/search_items_dto.dart';

extension SearchItemsMapper on SearchItemsDto {
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
