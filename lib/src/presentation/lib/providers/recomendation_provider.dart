import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_ports/recomendation_in_port/recomendation_in_port.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';
import 'package:domain/search_items/search_items.dart';

final recommendationsProvider = FutureProvider.family<
    List<SearchItems>,
    ({
      List<String> seedArtists,
      List<String> seedTracks,
    })>((ref, seeds) async {
  final useCase = getIt<RecommendationInPort>();
  return await useCase.getRecommendations(
    seedArtists: seeds.seedArtists,
    seedTracks: seeds.seedTracks,
  );
});
