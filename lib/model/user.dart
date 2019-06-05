class User  {
  int code;
  String message;
  Data data;

  User({this.code, this.message, this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      code: json['code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String displayName;
  String avatar;
  String phone;
  String token;

  Data({this.displayName, this.avatar, this.phone, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        phone: json['phone'],
        avatar: json['avatar'],
        displayName: json['displayName'],
        token: json['token'],
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'displayName': displayName,
      'avatar': avatar,
      'phone': phone,
      'token': token,
    };
  }
}