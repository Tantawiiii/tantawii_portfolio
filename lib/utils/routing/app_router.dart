import 'package:flutter/material.dart';
import 'package:tantawii_portfolio/utils/routing/routes.dart';
import 'package:tantawii_portfolio/web/home_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return null;
    }
  }
}
