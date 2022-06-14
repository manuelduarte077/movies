import 'package:flutter/material.dart';
import 'package:movies/helpers/helpers.dart';
import 'package:movies/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/details':
        return DetailsScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute<dynamic>(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const ErrorRoutes(),
    );
  }
}
