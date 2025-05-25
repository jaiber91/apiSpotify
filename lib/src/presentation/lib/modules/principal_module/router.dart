part of 'package.dart';

class RouterHomeModule {
  static get authPage => GoRouteApp(
        path: RouteNames.main.path,
        builder: (context, state) => const AuthPage(),
      );

  static get homePage => GoRouteApp(
        path: RouteNames.homePage.path,
        builder: (context, state) {
          final code = state.uri.queryParameters['code'];
          return HomePage(code: code ?? '');
        },
      );
}
