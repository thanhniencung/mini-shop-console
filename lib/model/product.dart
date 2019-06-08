class Product {
  String productName;
  String productImage;
  String updateAt;
  String cateId;

  int soldItems;
  int quantity;
  double price;

  Product({this.productName, this.productImage, this.updateAt,
    this.cateId, this.soldItems, this.quantity, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productName: json['productName'],
        productImage: json['productImage'],
        updateAt: json['updateAt'],
        cateId: json['cateId'],
        soldItems: json['soldItems'],
        quantity: json['quantity'],
        price: double.tryParse((json['price']).toString()) ?? 0
    );
  }
}

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