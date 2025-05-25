import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_ports/search_items_in_port/search_items_in_port.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';
import 'package:domain/search_items/search_items.dart';

final searchProvider =
    FutureProvider.family<List<SearchItems>, String>((ref, query) async {
  final useCase = getIt<SearchItemsInPort>();
  return await useCase.search(query);
});
