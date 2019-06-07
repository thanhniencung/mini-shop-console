class Error {
  int statusCode;
  String message;

  Error({this.statusCode, this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
        statusCode: json['code'],
        message: json['message']
    );
  }
}