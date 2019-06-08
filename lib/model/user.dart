class ListUser {
  List<UserData> data;

  ListUser({this.data});

  factory ListUser.fromJson(Map<String, dynamic> json) {
    return ListUser(
      data: parseData(json),
    );
  }

  static List<UserData> parseData(json) {
    if (json['data'] == null) {
      return null;
    }
    var list = json['data'] as List;
    return list.map((data) => UserData.fromJson(data)).toList();
  }
}

class User  {
  UserData data;

  User({this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  String displayName;
  String avatar;
  String phone;
  String token;

  UserData({this.displayName, this.avatar, this.phone, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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