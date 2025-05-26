import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_ports/recomendation_in_port/recomendation_in_port.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';
import 'package:domain/search_items/search_items.dart';

final recommendationsProvider =
    FutureProvider.family<List<SearchItems>, List<String>>(
        (ref, seedTracks) async {
  if (seedTracks.isEmpty) {
    throw Exception('Se necesita al menos un track como seed');
  }

  final useCase = getIt<RecommendationInPort>();
  return await useCase.getRecommendations(
    seedArtists: [],
    seedTracks: seedTracks,
  );
});
