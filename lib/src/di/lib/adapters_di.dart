import 'package:adapters/shared/http/http_interface.dart';
import 'package:adapters/shared/http/http_service.dart';
import 'package:adapters/university_adapter/adapter/get_university.dart';
import 'package:adapters/university_adapter/datasource/get_university_datasource.dart';
import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:out_ports/university_out_port/university_out_port.dart';

void adaptersDI(GetIt getIt) {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerLazySingleton<HttpService>(() => HttpService(
        HttpInterface(Dio()),
      ));

  getIt.registerLazySingleton<GetUniversityListDatasource>(
      () => GetUniversityListDatasource(getIt.get<HttpService>()));

  getIt.registerLazySingleton<GetUniversityListOutPort>(
      () => GetUniversityListAdapter(
            getIt.get<GetUniversityListDatasource>(),
          ));
}
