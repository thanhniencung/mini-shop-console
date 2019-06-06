import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';
import 'package:mini_shop_console/model/upload_image.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends ChangeNotifier {

  static ProductViewModel of(BuildContext context) {
    return Provider.of<ProductViewModel>(context);
  }

  Future<String> uploadImage(File file) async {
    var completer = new Completer<String>();
    try {
      FormData formData = new FormData.from({
        "file": new UploadFileInfo(file, basename(file.path)),
      });

      var response = await ChapiAPI.get().post(
        Endpoint.UPLOAD,
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent - $total");
        },
      );

      UploadImage image = UploadImage.fromJson(response.data);
      completer.complete(image.url);
      return completer.future;

    } catch (e) {
      completer.completeError(e);
    }
    return null;
  }
}