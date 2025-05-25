import 'package:domain/auth_user_domain/auth_user_domain.dart';
import 'package:in_ports/aut_user_in_port/auth_user_in_port.dart';
import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';

class AuthUserUseCase implements AuthUserInPort {
  final AuthUserOutPort _spotifyAuthOutPort;

  AuthUserUseCase(this._spotifyAuthOutPort);

  @override
  Future<void> login() async {
    await _spotifyAuthOutPort.launchSpotifyLogin();
  }

  @override
  Future<AuthUser> completeLogin(String code) async {
    final token = await _spotifyAuthOutPort.exchangeCodeForToken(code);
    final user = await _spotifyAuthOutPort.getUserProfile(token);
    return user;
  }
}
