import 'package:domain/search_items/search_items.dart';
import 'package:in_ports/recomendation_in_port/recomendation_in_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/recomendation_out_port/recomendation_out_port.dart';

class RecommendationUseCase implements RecommendationInPort {
  final RecommendationOutPort _outPort;
  final SessionStorageOutPort _storage;

  RecommendationUseCase(this._outPort, this._storage);

  @override
  Future<List<SearchItems>> getRecommendations({
    required List<String> seedTracks,
    List<String> seedArtists = const [],
  }) async {
    final token = await _storage.readToken();
    if (token == null) throw Exception('Token no disponible');

    return await _outPort.getRecommendations(
      seedTracks: seedTracks,
      seedArtists: seedArtists,
      token: token,
    );
  }
}
