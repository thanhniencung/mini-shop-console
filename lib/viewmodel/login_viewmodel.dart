import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_shop_console/model/user.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  String _phone;
  String _password;

  bool _hasErrorPhoneValidation;
  bool _hasErrorPassValidation;

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  static LoginViewModel of(BuildContext context) {
    return Provider.of<LoginViewModel>(context);
  }

  String validatePhone(String phone) {
    _hasErrorPassValidation = false;
    if (phone.isEmpty) {
      _hasErrorPassValidation = true;
      return "Thông tin bắt buộc";
    }

    if (phone.length != 10) {
      _hasErrorPassValidation = true;
      return "Số điện thoại có 10 số";
    }

    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(phone))
      return "Không hợp lệ";

    _phone = phone;

    return null;
  }

  String validatePass(String pass) {
    _hasErrorPhoneValidation = false;
    if (pass.isEmpty) {
      _hasErrorPhoneValidation = true;
      return "Thông tin bắt buộc";
    }

    if (pass.length < 6) {
      _hasErrorPhoneValidation = true;
      return "Yêu cầu lớn hơn 6 ký tự";
    }

    _password = pass;

    return null;
  }

  Future<User> login() async {
    if (!_hasErrorPassValidation && !_hasErrorPhoneValidation) {
      var completer = new Completer<User>();
      try {
        Response response = await ChapiAPI.get().post(
              Endpoint.LOGIN,
              data: {
                "phone": _phone,
                "password": _password,
              }
        );

        User user = new User.fromJson(response.data);
        // cache user info
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user", user.data.toJSON().toString());
        prefs.setString("token", user.data.token);

        completer.complete(user);
        return completer.future;

      } catch (e) {
        completer.completeError(e);
      }
    }
    return null;
  }

}