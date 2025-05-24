part of 'package.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  initialLocation: RouteNames.main.path,
  navigatorKey: navigatorKey,
  routes: [
    RouterHomeModule.homePage,
  ],
);
