import 'package:flutter/material.dart';

class UIUtils {
  static void toastSuccessMessage(BuildContext context, String message) {
    final snackBar =
    SnackBar(
        content: Text(message,
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void toastErrorMessage(BuildContext context, String message) {
    final snackBar =
    SnackBar(
        content: Text(message,
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}