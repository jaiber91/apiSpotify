import 'package:domain/search_items/search_items.dart';

abstract class SearchItemsOutPort {
  Future<List<SearchItems>> search(String query, String token);
}
