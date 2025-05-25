import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/search_items/search_items.dart';
import '../providers/favorites_seed_provider.dart';
import '../providers/recomendation_provider.dart';

final derivedRecommendationsProvider = FutureProvider<List<SearchItems>>((ref) {
  final seeds = ref.watch(favoriteSeedsProvider);

  if (seeds.isEmpty) return Future.value([]);

  return ref.watch(
    recommendationsProvider(
      (
        seedArtists: seeds.toList(),
        seedTracks: [],
      ),
    ).future,
  );
});
