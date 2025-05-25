import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'spotify_access_token', value: token);
  }

  Future<String?> readToken() async {
    return await _storage.read(key: 'spotify_access_token');
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'spotify_access_token');
  }
}
