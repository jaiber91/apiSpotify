import 'package:adapters/liked_track_adapter/adapter/liked_track_adapter.dart';
import 'package:adapters/liked_track_adapter/datasource/dtos/liked_track_dto.dart';
import 'package:adapters/liked_track_adapter/datasource/liked_track_datasource.dart';
import 'package:domain/liked_track/liked_track.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLikedTracksDatasource extends Mock implements LikedTracksDatasource {}

void main() {
  group('LikedTracksAdapter', () {
    late MockLikedTracksDatasource mockDatasource;
    late LikedTracksAdapter adapter;

    setUp(() {
      mockDatasource = MockLikedTracksDatasource();
      adapter = LikedTracksAdapter(mockDatasource);
    });

    test('devuelve lista de LikedTrack desde el datasource', () async {
      const token = 'fake_token';
      const dto = LikedTrackDto(
        id: '1',
        name: 'Canción',
        artist: 'Artista',
        imageUrl: 'url',
        previewUrl: 'preview.mp3',
      );

      when(() => mockDatasource.getLikedTracks(token))
          .thenAnswer((_) async => [dto]);

      final result = await adapter.getLikedTracks(token);

      expect(result, isA<List<LikedTrack>>());
      expect(result.length, 1);
      expect(result.first.name, equals('Canción'));
      expect(result.first.artist, equals('Artista'));

      verify(() => mockDatasource.getLikedTracks(token)).called(1);
    });
  });
}
