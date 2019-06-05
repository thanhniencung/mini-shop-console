class Cate {
  List<Data> data;

  Cate({this.data});

  factory Cate.fromJson(Map<String, dynamic> json) {
    return Cate(
        data: parseData(json)
    );
  }

  static List<Data> parseData(json) {
    var list = json['data'] as List;
    List<Data> results =
    list.map((data) => Data.fromJson(data)).toList();
    return results;
  }

}

class Data {
  String cateId;
  String cateName;

  Data({this.cateId, this.cateName});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      cateId: json['cateId'],
      cateName: json['cateName'],
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'cateId': cateId,
      'cateName': cateName
    };
  }
}