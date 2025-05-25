import 'package:adapters/auth_adapter/mapper/auth_mapper.dart';
import 'package:domain/auth_user_domain/auth_user_domain.dart';
import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';

import '../datasource/auth_user_datasource.dart';

class AuthAdapter implements AuthUserOutPort {
  final AuthUserDatasource _authUserDatasource;

  AuthAdapter(this._authUserDatasource);

  @override
  Future<void> launchSpotifyLogin() {
    return _authUserDatasource.launchLogin();
  }

  @override
  Future<String> exchangeCodeForToken(String code) {
    return _authUserDatasource.getToken(code);
  }

  @override
  Future<AuthUser> getUserProfile(String token) async {
    final dto = await _authUserDatasource.getUser(token);
    return dto.toDomain();
  }
}
