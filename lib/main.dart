import 'package:flutter/material.dart';
import 'package:flutter_university/src/configs/router_config/package.dart';
import 'package:flutter_university/src/di/lib/setup_di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/configs/getIt/getit_instance.dart';

void main() {
  setupDI(locator);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter University',
      routerConfig: appRouter,
      themeMode: ThemeMode.system,
    );
  }
}
