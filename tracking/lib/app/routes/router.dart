

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
       case RoutesName.addRecencement:
        return MaterialPageRoute(builder: (context) => const AddRecencement());
   
      
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("UnKnown route"),
          ),
        );
    }
  }
}
