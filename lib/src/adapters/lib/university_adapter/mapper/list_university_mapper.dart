import 'package:domain/university_domain/university_domain.dart';

import '../datasource/dto/list_university_dto.dart';

extension ListUniversityMapper on ListUniversityDto {
  UniversityDomain toDomain() {
    return UniversityDomain(
      alphaTwoCode: alphaTwoCode,
      domains: domains,
      country: country,
      stateProvince: stateProvince,
      webPages: webPages,
      name: name,
    );
  }
}
