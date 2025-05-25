import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';
import 'package:in_ports/aut_user_in_port/auth_user_in_port.dart';
import 'package:domain/auth_user_domain/auth_user_domain.dart';

final authLoginProvider = Provider<void Function()>(
  (ref) {
    final auth = getIt<AuthUserInPort>();
    return () => auth.login();
  },
);

final completeLoginProvider = FutureProvider.family<AuthUser, String>(
  (ref, code) async {
    final auth = getIt<AuthUserInPort>();
    return await auth.completeLogin(code);
  },
);
