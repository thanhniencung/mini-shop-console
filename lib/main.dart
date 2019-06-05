import 'package:flutter/material.dart';
import 'package:mini_shop_console/router.dart';
import 'package:mini_shop_console/shared/app_color.dart';
import 'package:mini_shop_console/view/splash_view.dart';

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
      home: SplashView(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}