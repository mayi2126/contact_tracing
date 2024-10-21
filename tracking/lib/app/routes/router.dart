import 'package:flutter/material.dart';
import 'package:tracking_pregnant/app/routes/routes_name.dart';
import 'package:tracking_pregnant/core/cores.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case RoutesName.main:
        return MaterialPageRoute(builder: (context) => const DashboardPage());
      case RoutesName.addRecensement:
        return MaterialPageRoute(builder: (context) => const AddRecensement());
      case RoutesName.mainRecensement:
        return MaterialPageRoute(builder: (context) => const MainRecensement());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("UnKnown route"),
          ),
        );
    }
  }
}
