import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.orange[300],
        body: SplashWidget()
    );
  }
}

class SplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashStateWidget();
  }
}

class _SplashStateWidget extends State<SplashWidget> {

  @override
  void initState() {
    super.initState();

    delayAndLaunch();
  }

  delayAndLaunch() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
      ),
    );
  }
}