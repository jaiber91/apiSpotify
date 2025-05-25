import 'package:domain/auth_user_domain/auth_user_domain.dart';

abstract class AuthUserOutPort {
  Future<void> launchSpotifyLogin();
  Future<String> exchangeCodeForToken(String code);
  Future<AuthUser> getUserProfile(String token);
}
