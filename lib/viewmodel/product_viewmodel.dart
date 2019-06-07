import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_shop_console/network/chapi_api.dart';
import 'package:mini_shop_console/network/endpoint.dart';
import 'package:mini_shop_console/model/upload_image.dart';
import 'package:mini_shop_console/model/product.dart';
import 'package:mini_shop_console/model/error.dart';
import 'package:mini_shop_console/model/list_product.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends ChangeNotifier {
  String _productName;
  String _productImage;
  String _cateId;

  int _quantity;
  double _price;

  String get productName => _productName;

  String get image => _productImage;

  set image(String value) {
    _productImage = value;
    notifyListeners();
  }

  String get cateId => _cateId;

  set cateId(String value) {
    _cateId = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  set productName(String value) {
    _productName = value;
  }

  static ProductViewModel of(BuildContext context) {
    return Provider.of<ProductViewModel>(context);
  }

  void onDropdownChange(String newCateId) {
    this._cateId = newCateId;
    notifyListeners();
  }

  Future<List<Product>> listProduct() async {
    var completer = new Completer<List<Product>>();
    try {
      var response = await ChapiAPI.get().get(
          Endpoint.LIST_PRODUCT
      );

      ListProduct listProduct = ListProduct.fromJson(response.data);
      completer.complete(listProduct.data);

    } on DioError catch(e) {
      if(e.response != null) {
        completer.completeError(Error.fromJson(e.response.data));
      } else {
        completer.completeError(e);
      }
    }

    return completer.future;
  }

  Future<Product> addProduct() async {
    var completer = new Completer<Product>();
    try {
      var response = await ChapiAPI.get().post(
          Endpoint.ADD_PRODUCT,
          data: {
            "productName": _productName,
            "productImage":  _productImage,
            "cateId":  _cateId,
            "quantity": _quantity,
            "price": _price
          }
      );

      Product product = Product.fromJson(response.data);
      completer.complete(product);

    } on DioError catch(e) {
      if(e.response != null) {
        completer.completeError(Error.fromJson(e.response.data));
      } else {
        completer.completeError(e);
      }
    }

    return completer.future;
  }

  Future<String> uploadImage(File file) async {
    var completer = new Completer<String>();
    try {
      FormData formData = new FormData.from({
        "file": new UploadFileInfo(file, basename(file.path)),
      });

      var response = await ChapiAPI.get().post(
        Endpoint.UPLOAD,
        data: formData
      );

      UploadImage image = UploadImage.fromJson(response.data);
      this.image = image.url;

      completer.complete(image.url);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  String validateProductName(String value) {
    if (value.isEmpty) {
      return "Thông tin bắt buộc";
    }

    if (value.length < 6) {
      return "Tên sản phẩm quá ngắn";
    }

    this._productName = value;
    return null;
  }

  String validatePrice(String value) {
    double val = double.tryParse(value) ?? 0;
    if (val <= 0) {
      return "Giá cả không hợp lệ";
    }

    this._price = val;
    return null;
  }

  String validateQuantity(String value) {
    int val = int.tryParse(value) ?? 0;
    if (val <= 0) {
      return "Số lượng không hợp lệ";
    }

    this._quantity = val;
    return null;
  }

}