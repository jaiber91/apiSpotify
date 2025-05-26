import 'package:get_it/get_it.dart';
import 'package:in_ports/aut_user_in_port/auth_user_in_port.dart';
import 'package:in_ports/aut_user_in_port/get_token_in_port.dart';
import 'package:in_ports/recomendation_in_port/recomendation_in_port.dart';
import 'package:in_ports/search_items_in_port/search_items_in_port.dart';
import 'package:in_ports/save_track_in_port/save_track_in_port.dart';
import 'package:in_ports/liked_track_in_port/liked_track_in_port.dart';

import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/recomendation_out_port/recomendation_out_port.dart';
import 'package:out_ports/search_items_out_port/search_items_out_port.dart';
import 'package:out_ports/save_track_out_port/save_track_out_port.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';

import 'package:use_cases/auth_user_use_case/auth_user_use_case.dart';
import 'package:use_cases/auth_user_use_case/get_sesion_toke_use_case.dart';
import 'package:use_cases/recomendation_use_cases/recomendation_use_case.dart';
import 'package:use_cases/search_items_use_cases/search_items_use_case.dart';
import 'package:use_cases/save_track_use_case/save_track_use_case.dart';
import 'package:use_cases/liked_track_use_case/liked_track_use_case.dart';

void businessDI(GetIt getIt) {
  getIt.registerLazySingleton<AuthUserInPort>(
    () => AuthUserUseCase(
      getIt<AuthUserOutPort>(),
      getIt<SessionStorageOutPort>(),
    ),
  );

  getIt.registerLazySingleton<GetSessionTokenInPort>(
    () => GetSessionTokenUseCase(getIt<SessionStorageOutPort>()),
  );

  getIt.registerLazySingleton<SearchItemsInPort>(
    () => SearchItemsUseCase(
      getIt<SearchItemsOutPort>(),
      getIt<SessionStorageOutPort>(),
    ),
  );

  getIt.registerLazySingleton<RecommendationInPort>(
    () => RecommendationUseCase(
      getIt<RecommendationOutPort>(),
      getIt<SessionStorageOutPort>(),
    ),
  );

  getIt.registerLazySingleton<SaveTrackInPort>(
    () => SaveTrackUseCase(
      getIt<SaveTrackOutPort>(),
      getIt<SessionStorageOutPort>(),
    ),
  );

  getIt.registerLazySingleton<LikedTrackInPort>(
    () => LikedTrackUseCase(
      getIt<LikedTrackOutPort>(),
      getIt<SessionStorageOutPort>(),
    ),
  );
}
