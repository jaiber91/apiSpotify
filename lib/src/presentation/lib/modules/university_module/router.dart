part of 'package.dart';

class RouterHomeModule {
  static get homePage => GoRouteApp(
        path: RouteNames.main.path,
        builder: (context, state) => const HomePage(),
        routes: [
          detailPage,
        ],
      );

  static get detailPage => GoRouteApp(
        path: RouteNames.detailPage.path,
        builder: (context, state) => const DetailPage(),
      );
}
