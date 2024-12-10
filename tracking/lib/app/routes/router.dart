import 'package:flutter/material.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/app/routes/routes_name.dart';
import 'package:tracking/core/cores.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case RoutesName.main:
        return MaterialPageRoute(builder: (context) => const DashboardPage());
      case RoutesName.addRecensement:
        return MaterialPageRoute(builder: (context) => const AddRecensementScreen());
      case RoutesName.mainRecensement:
        return MaterialPageRoute(builder: (context) => const MainRecensement());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RoutesName.causerie:
        return MaterialPageRoute(builder: (context) => const CauseriePage());

      case RoutesName.addCauserie:
        return MaterialPageRoute(builder: (context) => const AddCauserie());

      case RoutesName.addVisite:
        return MaterialPageRoute(builder: (context) => const AddVisitePage());

      case RoutesName.visite:
        return MaterialPageRoute(builder: (context) => const VisitePage());

      case RoutesName.addMember:
        return MaterialPageRoute(builder: (context) => const AddMenageMemberScreen());

      case RoutesName.showVisiteAndCauserie:
        final VisiteModel visiteModel = arguments as VisiteModel;
        return MaterialPageRoute(
            builder: (context) => ShowPage(arguments: visiteModel));
      case RoutesName.showCauserie:
        final VisiteModel causerieModel = arguments as VisiteModel;
        return MaterialPageRoute(
            builder: (context) => ShowCauseriePage(arguments: causerieModel));
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("UnKnown route"),
          ),
        );
    }
  }
}
