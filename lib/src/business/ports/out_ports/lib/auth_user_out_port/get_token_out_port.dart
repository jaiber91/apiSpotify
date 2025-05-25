abstract class SessionStorageOutPort {
  Future<void> saveToken(String token);
  Future<String?> readToken();
  Future<void> clearToken();
}
