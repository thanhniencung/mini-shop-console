import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_shop_console/model/cate.dart';
import 'package:provider/provider.dart';

class CateViewModel extends ChangeNotifier {

  static CateViewModel of(BuildContext context) {
    return Provider.of<CateViewModel>(context);
  }

  Future<List<Data>> loadCates() async {
    try {
      print("000");
      Response response = await ChapiAPI.get().get(Endpoint.GET_CATES);
      print(response.data);
      Cate cate = Cate.fromJson(response.data);
      return cate.data;
    } catch(e) {
      print("loi ne : ${e}");
    }
  }
}