import 'package:flutter/material.dart';
import 'package:mini_shop_console/view/login_view.dart';
import 'package:mini_shop_console/router.dart';
import 'package:mini_shop_console/shared/app_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keto',
      theme: ThemeData(
          primaryColor: primary,
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white
              )
          )
      ),
      home: LoginView(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}