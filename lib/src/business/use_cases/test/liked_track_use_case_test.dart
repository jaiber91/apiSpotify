import 'package:domain/liked_track/liked_track.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';
import 'package:use_cases/liked_track_use_case/liked_track_use_case.dart';

class MockLikedTrackOutPort extends Mock implements LikedTrackOutPort {}

class MockSessionStorageOutPort extends Mock implements SessionStorageOutPort {}

void main() {
  late MockLikedTrackOutPort mockOutPort;
  late MockSessionStorageOutPort mockStorage;
  late LikedTrackUseCase useCase;

  setUp(() {
    mockOutPort = MockLikedTrackOutPort();
    mockStorage = MockSessionStorageOutPort();
    useCase = LikedTrackUseCase(mockOutPort, mockStorage);
  });

  test('Devuelve lista de canciones favoritas si hay token', () async {
    // Arrange
    const token = 'mock-token';
    final tracks = [
      LikedTrack(
        id: '1',
        name: 'Song 1',
        artist: 'Artist 1',
        imageUrl: '',
        previewUrl: null,
      ),
    ];

    when(() => mockStorage.readToken()).thenAnswer((_) async => token);
    when(() => mockOutPort.getLikedTracks(token))
        .thenAnswer((_) async => tracks);

    // Act
    final result = await useCase.getLikedTracks();

    // Assert
    expect(result, isA<List<LikedTrack>>());
    expect(result.length, 1);
    expect(result.first.name, 'Song 1');
  });

  test('Lanza excepción si no hay token', () async {
    when(() => mockStorage.readToken()).thenAnswer((_) async => null);

    expect(() => useCase.getLikedTracks(), throwsA(isA<Exception>()));
  });
}
