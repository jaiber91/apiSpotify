import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/search_items/search_items.dart';
import '../providers/favorites_seed_provider.dart';
import '../providers/recomendation_provider.dart';

final derivedRecommendationsProvider =
    FutureProvider<List<SearchItems>>((ref) async {
  final seeds = ref.watch(favoriteSeedsProvider);

  if (seeds.isEmpty) return [];

  try {
    return await ref.watch(
      recommendationsProvider(seeds.toList()).future,
    );
  } catch (e) {
    throw Exception('Recomendaciones no disponibles en este momento.');
  }
});
