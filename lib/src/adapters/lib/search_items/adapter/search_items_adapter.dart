import 'package:adapters/search_items/mapper/search_items_mapper.dart';
import 'package:domain/search_items/search_items.dart';
import 'package:out_ports/search_items_out_port/search_items_out_port.dart';

import '../datasource/search_items_datasource.dart';

class SearchItemsAdapter implements SearchItemsOutPort {
  final SearchDatasource _spotifySearchDatasource;

  SearchItemsAdapter(this._spotifySearchDatasource);

  @override
  Future<List<SearchItems>> search(String query, String token) async {
    final dtoList = await _spotifySearchDatasource.search(query, token);
    return dtoList.map((dto) => dto.toDomain()).toList();
  }
}
