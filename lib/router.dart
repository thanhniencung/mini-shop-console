import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';
import 'package:mini_shop_console/view/dashboard_view.dart';
import 'package:mini_shop_console/view/login_view.dart';
import 'package:mini_shop_console/view/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardView());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}