import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_items_dto.freezed.dart';
part 'search_items_dto.g.dart';

@freezed
class SearchItemsDto with _$SearchItemsDto {
  const factory SearchItemsDto({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) = _SearchItemsDto;

  factory SearchItemsDto.fromJson(Map<String, dynamic> json) =>
      _$SearchItemsDtoFromJson(json);
}
