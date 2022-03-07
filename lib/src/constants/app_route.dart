import 'package:crypto/src/ui/app_start/app_start_screen.dart';
import 'package:crypto/src/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) {
        switch (routeSettings.name) {
          case AppStartScreen.routeName:
            return const AppStartScreen();

          case HomeScreen.routeName:
            return const HomeScreen();

          default:
            return const AppStartScreen();
        }
      },
    );
  }
}
