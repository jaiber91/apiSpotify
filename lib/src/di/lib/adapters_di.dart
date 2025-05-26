import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:adapters/recomendation_adapter/adapter/recomendation_adapter.dart';
import 'package:adapters/recomendation_adapter/datasource/recommendation_datasource.dart';
import 'package:adapters/search_items/datasource/search_items_datasource.dart';
import 'package:adapters/shared/http/http_interface.dart';
import 'package:adapters/shared/http/http_service.dart';
import 'package:adapters/shared/storage/secure_storage_service.dart';
import 'package:adapters/auth_adapter/adapter/auth_adapter.dart';
import 'package:adapters/auth_adapter/datasource/auth_user_datasource.dart';
import 'package:adapters/auth_adapter/adapter/sesion_storage_adapter.dart';
import 'package:adapters/search_items/adapter/search_items_adapter.dart';
import 'package:adapters/save_track_adapter/datasource/datasource_save_track.dart';
import 'package:adapters/save_track_adapter/adapter/save_track_adapter.dart';
import 'package:adapters/liked_track_adapter/datasource/liked_track_datasource.dart';
import 'package:adapters/liked_track_adapter/adapter/liked_track_adapter.dart';

import 'package:out_ports/auth_user_out_port/auth_user_out_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';
import 'package:out_ports/recomendation_out_port/recomendation_out_port.dart';
import 'package:out_ports/search_items_out_port/search_items_out_port.dart';
import 'package:out_ports/save_track_out_port/save_track_out_port.dart';
import 'package:out_ports/liked_track_out_port/liked_track_out_port.dart';

void adaptersDI(GetIt getIt) {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerLazySingleton<HttpService>(() => HttpService(
        HttpInterface(Dio()),
      ));

  getIt.registerLazySingleton<AuthUserDatasource>(
    () => AuthUserDatasource(
      httpService: getIt.get<HttpService>(),
    ),
  );

  getIt.registerLazySingleton<AuthUserOutPort>(
    () => AuthAdapter(getIt.get<AuthUserDatasource>()),
  );

  getIt.registerLazySingleton<SecureStorageService>(
      () => SecureStorageService());

  getIt.registerLazySingleton<SessionStorageOutPort>(
    () => SessionStorageAdapter(getIt<SecureStorageService>()),
  );

  getIt.registerLazySingleton<SpotifySearchDatasource>(
    () => SpotifySearchDatasource(getIt.get<HttpService>()),
  );
  getIt.registerLazySingleton<SearchItemsOutPort>(
      () => SearchItemsAdapter(getIt<SpotifySearchDatasource>()));

  getIt.registerLazySingleton<RecommendationDatasource>(
    () => RecommendationDatasource(getIt<HttpService>()),
  );

  getIt.registerLazySingleton<RecommendationOutPort>(
    () => RecommendationAdapter(getIt<RecommendationDatasource>()),
  );

  getIt.registerLazySingleton<DatasourceSaveTrack>(
    () => DatasourceSaveTrack(getIt<HttpService>()),
  );

  getIt.registerLazySingleton<SaveTrackOutPort>(
    () => SaveTrackAdapter(getIt<DatasourceSaveTrack>()),
  );
  getIt.registerLazySingleton<LikedTracksDatasource>(
    () => LikedTracksDatasource(getIt<HttpService>()),
  );

  getIt.registerLazySingleton<LikedTrackOutPort>(
    () => LikedTracksAdapter(getIt<LikedTracksDatasource>()),
  );
}
