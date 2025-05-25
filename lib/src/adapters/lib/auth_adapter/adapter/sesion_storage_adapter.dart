import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';

import '../../shared/storage/secure_storage_service.dart';

class SessionStorageAdapter implements SessionStorageOutPort {
  final SecureStorageService _storage;

  SessionStorageAdapter(this._storage);

  @override
  Future<void> clearToken() => _storage.clearToken();

  @override
  Future<String?> readToken() => _storage.readToken();

  @override
  Future<void> saveToken(String token) => _storage.saveToken(token);
}
