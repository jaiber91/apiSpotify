import 'package:get_it/get_it.dart';
import 'package:in_ports/aut_user_in_port/auth_user_in_port.dart';
import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';
import 'package:use_cases/auth_user_use_case/auth_user_use_case.dart';

void businessDI(GetIt getIt) {
  getIt.registerLazySingleton<AuthUserInPort>(
    () => AuthUserUseCase(getIt<AuthUserOutPort>()),
  );
}
