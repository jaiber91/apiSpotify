import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_ports/aut_user_in_port/get_token_in_port.dart';
import 'package:flutter_spotify/src/presentation/lib/shared/utils/export_di.dart';

final authSessionProvider = FutureProvider<String?>((ref) async {
  final getTokenUseCase = getIt<GetSessionTokenInPort>();
  return await getTokenUseCase.getToken();
});
