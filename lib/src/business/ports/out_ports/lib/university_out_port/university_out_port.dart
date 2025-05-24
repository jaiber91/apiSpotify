import 'package:domain/university_domain/university_domain.dart';

abstract class GetUniversityListOutPort {
  Future<List<UniversityDomain>> getListUniversity();
}
