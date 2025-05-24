part of 'package.dart';

class RouterHomeModule {
  static get homePage => GoRouteApp(
        path: RouteNames.main.path,
        builder: (context, state) => const HomePage(),
      );

  static get detailPage => GoRouteApp(
        path: RouteNames.detailPage.path, // debe ser '/detail_page'
        builder: (context, state) {
          final code = state.uri.queryParameters['code'];
          print('✅ Entró al builder de detailPage con code: $code');
          return SpotifyCallbackPage(code: code!);
        },
      );
}
