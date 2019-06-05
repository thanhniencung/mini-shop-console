import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';
import 'package:mini_shop_console/view/customer_view.dart';
import 'package:mini_shop_console/view/dashboard_view.dart';
import 'package:mini_shop_console/view/order_view.dart';
import 'package:mini_shop_console/view/product_view.dart';
import 'package:mini_shop_console/view/widget/fab_bottom_app_bar.dart';
import 'package:mini_shop_console/view/widget/fab_with_icons.dart';
import 'package:mini_shop_console/view/widget/layout.dart';

// https://github.com/bizz84/bottom_bar_fab_flutter
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static const int ADD_PRODUCT = 0;
  static const int ADD_ORDER = 1;

  bool overlayButton = true;
  int _currentIndex = 0;

  final List<Widget> _children = [
    DashboardView(),
    OrderView(),
    ProductView(),
    CustomerView()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _children[_currentIndex],
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.black54,
        selectedColor: primary,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.timeline),
          FABBottomAppBarItem(iconData: Icons.receipt),
          FABBottomAppBarItem(iconData: Icons.shopping_basket),
          FABBottomAppBarItem(iconData: Icons.group),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          Navigator.pushNamed(context, '/add_product', arguments: 0);
        },
        child: new Icon(Icons.add, color: Colors.white,),
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}