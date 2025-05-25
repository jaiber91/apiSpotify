import 'package:domain/auth_user_domain/auth_user_domain.dart';

abstract class AuthUserInPort {
  Future<void> login();
  Future<AuthUser> completeLogin(String code);
}
