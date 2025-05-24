import 'package:adapters/university_adapter/mapper/list_university_mapper.dart';
import 'package:domain/university_domain/university_domain.dart';
import 'package:out_ports/university_out_port/university_out_port.dart';

import '../datasource/dto/list_university_dto.dart';
import '../datasource/get_university_datasource.dart';

class GetUniversityListAdapter implements GetUniversityListOutPort {
  final GetUniversityListDatasource _universityListDatasource;

  GetUniversityListAdapter(this._universityListDatasource);

  @override
  Future<List<UniversityDomain>> getListUniversity() async {
    final List<ListUniversityDto> universityList =
        await _universityListDatasource.getListUniversity();

    return universityList.map((university) => university.toDomain()).toList();
  }
}
