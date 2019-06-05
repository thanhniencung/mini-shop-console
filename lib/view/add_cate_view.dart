import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';

class AddCateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Thêm danh mục"),
          backgroundColor: primary,
          leading: IconButton(
            icon: Icon(Icons.close),
            padding: EdgeInsets.all(4.0),
            iconSize: 34.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: AddCatehWidget()
    );
  }
}

class AddCatehWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCateStateWidget();
  }
}

class _AddCateStateWidget extends State<AddCatehWidget> {

  @override
  void initState() {
    super.initState();
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