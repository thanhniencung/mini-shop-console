import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';

class AddProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Thêm sản phẩm"),
          backgroundColor: primary,
          leading: IconButton(
            icon: Icon(Icons.close),
            padding: EdgeInsets.all(4.0),
            iconSize: 34.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: AddProductWidget()
    );
  }
}

class AddProductWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddProductStateWidget();
  }
}

class _AddProductStateWidget extends State<AddProductWidget> {

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