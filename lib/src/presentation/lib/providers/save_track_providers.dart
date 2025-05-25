import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_ports/save_track_in_port/save_track_in_port.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';

final saveTrackFavoriteProvider =
    Provider<Future<void> Function(List<String>)>((ref) {
  final useCase = getIt<SaveTrackInPort>();
  return (List<String> trackIds) => useCase.saveTracks(trackIds);
});
