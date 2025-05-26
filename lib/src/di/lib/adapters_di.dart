part of 'package.dart';

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

  getIt.registerLazySingleton<SearchDatasource>(
    () => SearchDatasource(getIt.get<HttpService>()),
  );
  getIt.registerLazySingleton<SearchItemsOutPort>(
      () => SearchItemsAdapter(getIt<SearchDatasource>()));

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
