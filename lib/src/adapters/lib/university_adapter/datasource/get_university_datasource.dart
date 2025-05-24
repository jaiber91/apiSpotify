import 'package:flutter/foundation.dart';

import '../../shared/http/http_path.dart';
import '../../shared/http/http_service.dart';
import 'dto/list_university_dto.dart';

class GetUniversityListDatasource {
  final HttpService _httpService;

  GetUniversityListDatasource(this._httpService);

  Future<List<ListUniversityDto>> getListUniversity() async {
    try {
      final response = await _httpService.get(
        path: HttpPath.path,
      );
      final List<dynamic> data = response.data;

      final listUniversity =
          data.map((json) => ListUniversityDto.fromJson(json)).toList();

      return listUniversity;
    } catch (e, stack) {
      debugPrint('Error en getListuniversity: $e\n$stack');
      return [];
    }
  }
}
