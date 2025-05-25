import 'package:domain/auth_user_domain/auth_user_domain.dart';

import '../datasource/dto/auth_user_dto.dart';

extension AuthUserMapper on AuthUserDto {
  AuthUser toDomain() {
    return AuthUser(
      id: id,
      email: email,
      displayName: displayName,
    );
  }
}
