import 'package:domain/search_items/search_items.dart';
import 'package:in_ports/search_items_in_port/search_items_in_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/search_items_out_port/search_items_out_port.dart';

class SearchItemsUseCase implements SearchItemsInPort {
  final SearchItemsOutPort _searchItemsOutPort;
  final SessionStorageOutPort _tokenStorage;

  SearchItemsUseCase(this._searchItemsOutPort, this._tokenStorage);

  @override
  Future<List<SearchItems>> search(String query) async {
    final token = await _tokenStorage.readToken();
    if (token == null) throw Exception('Token no disponible');
    return await _searchItemsOutPort.search(query, token);
  }
}
