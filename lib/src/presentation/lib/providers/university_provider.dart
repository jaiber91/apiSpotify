import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_university/src/presentation/lib/shared/utils/export_di.dart';
import 'package:in_ports/university_in_port/university_in_port.dart';
import 'package:domain/university_domain/university_domain.dart';

final getUniversityProvider =
    FutureProvider<List<UniversityDomain>>((ref) async {
  final getUniversity = getIt<GetUniversityListInPort>();
  return await getUniversity.getListUniversity();
});

final selectedUniversityProvider =
    StateProvider<UniversityDomain?>((ref) => null);

final selectedImageProvider = StateProvider<Uint8List?>((ref) => null);
