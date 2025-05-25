import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/src/configs/router_config/package.dart';
import 'package:flutter_spotify/src/di/lib/setup_di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/configs/getIt/getit_instance.dart';

void main() {
  setupDI(locator);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appLinks = AppLinks();
  bool _handled = false;

  @override
  void initState() {
    super.initState();
    _handleDeepLinks();
  }

  void _handleDeepLinks() async {
    _appLinks.uriLinkStream.listen(_handleUri, onError: (err) {
      debugPrint('❌ Error escuchando uriLinkStream: $err');
    });

    try {
      final Uri? initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _handleUri(initialLink);
      }
    } catch (err) {
      debugPrint('❌ Error obteniendo enlace inicial: $err');
    }
  }

  void _handleUri(Uri uri) {
    if (_handled) return;
    _handled = true;

    final normalizedUri =
        Uri.parse(uri.toString().replaceFirst('callback/', 'callback'));

    if (normalizedUri.queryParameters.containsKey('code')) {
      final code = normalizedUri.queryParameters['code'];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        appRouter.go('${RouteNames.homePage.path}?code=$code');
      });
    } else {
      debugPrint(' No se encontró parámetro code en URI: $normalizedUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Spotify',
      routerConfig: appRouter,
      themeMode: ThemeMode.system,
    );
  }
}
