import 'package:domain/search_items/search_items.dart';

abstract class SearchItemsInPort {
  Future<List<SearchItems>> search(String query);
}
