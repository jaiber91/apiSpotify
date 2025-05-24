import 'package:domain/university_domain/university_domain.dart';
import 'package:in_ports/university_in_port/university_in_port.dart';
import 'package:out_ports/university_out_port/university_out_port.dart';

class GetListUniversityUCase implements GetUniversityListInPort {
  final GetUniversityListOutPort _universityListOutPort;

  GetListUniversityUCase(this._universityListOutPort);

  @override
  Future<List<UniversityDomain>> getListUniversity() async {
    return await _universityListOutPort.getListUniversity();
  }
}
