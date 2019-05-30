import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: LoginWidget(),
        )
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginStateWidget();
  }
}

class _LoginStateWidget extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}