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
    var data = json['data'];
    return Product(
        productName: data['productName'],
        productImage: data['productImage'],
        updateAt: data['updateAt'],
        cateId: data['cateId'],
        soldItems: data['soldItems'],
        quantity: data['quantity'],
        price: double.tryParse((data['price']).toString()) ?? 0
    );
  }

}