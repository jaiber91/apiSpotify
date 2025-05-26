import 'package:adapters/recomendation_adapter/mapper/recommendation_mapper.dart';
import 'package:domain/search_items/search_items.dart';
import 'package:out_ports/recomendation_out_port/recomendation_out_port.dart';

import '../datasource/recommendation_datasource.dart';

class RecommendationAdapter implements RecommendationOutPort {
  final RecommendationDatasource _datasource;

  RecommendationAdapter(this._datasource);

  @override
  Future<List<SearchItems>> getRecommendations({
    required List<String> seedArtists,
    required List<String> seedTracks,
    required String token,
  }) async {
    final dtoList = await _datasource.getRecommendations(
      seedArtists: seedArtists,
      seedTracks: seedTracks,
      token: token,
    );

    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}
