import 'package:domain/search_items/search_items.dart';

abstract class RecommendationInPort {
  Future<List<SearchItems>> getRecommendations({
    required List<String> seedTracks,
    List<String> seedArtists = const [],
  });
}
