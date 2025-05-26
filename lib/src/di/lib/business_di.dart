part of 'package.dart';

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
