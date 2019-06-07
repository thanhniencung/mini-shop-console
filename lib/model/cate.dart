class Cate {
  List<CateData> data;

  Cate({this.data});

  factory Cate.fromJson(Map<String, dynamic> json) {
    return Cate(
        data: parseData(json)
    );
  }

  static List<CateData> parseData(json) {
    var list = json['data'] as List;
    return list.map((data) => CateData.fromJson(data)).toList();
  }

}

class CateData {
  String cateId;
  String cateName;

  CateData({this.cateId, this.cateName});

  factory CateData.fromJson(Map<String, dynamic> json) {
    return CateData(
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