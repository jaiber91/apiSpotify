import 'package:get_it/get_it.dart';
import 'package:in_ports/university_in_port/university_in_port.dart';
import 'package:out_ports/university_out_port/university_out_port.dart';
import 'package:use_cases/university_use_cases/list_university_use_case.dart';

void businessDI(GetIt getIt) {
  getIt.registerLazySingleton<GetUniversityListInPort>(
    () => GetListUniversityUCase(getIt<GetUniversityListOutPort>()),
  );
}
