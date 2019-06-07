import 'package:mini_shop_console/model/product.dart';

class ListProduct {
  List<Product> data;

  ListProduct({this.data});

  factory ListProduct.fromJson(Map<String, dynamic> json) {
      return ListProduct(
        data: parseData(json)
      );
  }

  static List<Product> parseData(json) {
    var list = json['data'] as List;
    return list.map((data) => Product.fromJson(data)).toList();
  }
}