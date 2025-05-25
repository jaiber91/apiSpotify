import 'package:adapters/auth_adapter/adapter/auth_adapter.dart';
import 'package:adapters/auth_adapter/datasource/auth_user_datasource.dart';
import 'package:adapters/shared/http/http_interface.dart';
import 'package:adapters/shared/http/http_service.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';

void adaptersDI(GetIt getIt) {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerLazySingleton<HttpService>(() => HttpService(
        HttpInterface(Dio()),
      ));

  getIt.registerLazySingleton<AuthUserDatasource>(
    () => AuthUserDatasource(
      httpService: getIt.get<HttpService>(),
    ),
  );

  getIt.registerLazySingleton<AuthUserOutPort>(
    () => AuthAdapter(getIt.get<AuthUserDatasource>()),
  );
}
