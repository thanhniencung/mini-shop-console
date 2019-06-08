import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:mini_shop_console/model/error.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/model/user.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';

class UserViewModel extends ChangeNotifier {
    String _avatar;
    String _name;
    String _createdAt;

    String get avatar => _avatar;

    set avatar(String value) {
      _avatar = value;
    }

    String get name => _name;

    set name(String value) {
      _name = value;
    }

    String get createdAt => _createdAt;

    set createdAt(String value) {
      _createdAt = value;
    }

    static UserViewModel of(BuildContext context) {
      return Provider.of<UserViewModel>(context);
    }

    Future<List<UserData>> listUsers() async {
      var completer = new Completer<List<UserData>>();
      try {
        var response = await ChapiAPI.get().get(
            Endpoint.LIST_USER
        );

        ListUser listUser = ListUser.fromJson(response.data);
        completer.complete(listUser.data);

      } on DioError catch(e) {
        if(e.response != null) {
          completer.completeError(Error.fromJson(e.response.data));
        } else {
          completer.completeError(e);
        }
      } catch(e) { completer.completeError(e); }

      return completer.future;
    }

}