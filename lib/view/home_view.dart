import 'package:flutter/material.dart';
import 'package:mini_shop_console/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ChangeNotifierProvider<LoginViewModel>(
          builder: (_) => LoginViewModel(),
          child: HomeWidget(),
        )
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeStateWidget();
  }
}

class _HomeStateWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Messages'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
        )
      ],
    );
  }
}