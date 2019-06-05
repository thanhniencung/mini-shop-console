import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_shop_console/model/cate.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends ChangeNotifier {
  Future<Cate> loadCates() async {
    var completer = new Completer<Cate>();
    try {
      Response response = await ChapiAPI.get().get(Endpoint.GET_CATES);
      Cate cate = new Cate.fromJson(response.data);
      completer.complete(cate);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}