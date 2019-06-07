import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void navigationPage() async {
    // check logic
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get("user") == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
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