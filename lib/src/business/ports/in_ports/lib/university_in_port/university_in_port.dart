import 'package:domain/university_domain/university_domain.dart';

abstract class GetUniversityListInPort {
  Future<List<UniversityDomain>> getListUniversity();
}
