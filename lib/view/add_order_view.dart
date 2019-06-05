import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_shop_console/shared/app_color.dart';

class AddOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Tạo đơn hàng"),
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
        body: AddOrderWidget()
    );
  }
}

class AddOrderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddOrderStateWidget();
  }
}

class _AddOrderStateWidget extends State<AddOrderWidget> {

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