import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/view/dashboard_view.dart';
import 'package:mini_shop_console/view/home_view.dart';
import 'package:mini_shop_console/view/login_view.dart';
import 'package:mini_shop_console/view/add_cate_view.dart';
import 'package:mini_shop_console/view/add_order_view.dart';
import 'package:mini_shop_console/view/add_product_view.dart';

import 'main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardView());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case '/add_cate':
        return MaterialPageRoute(builder: (_) => AddCateView());

      case '/add_product':
        return MaterialPageRoute(builder: (_) => AddProductView());

      case '/add_order':
        return MaterialPageRoute(builder: (_) => AddOrderView());

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