import 'package:dio/dio.dart';

class ChapiAPI {
  static int CONNECTION_TIMEOUT = 10000;
  static int READ_TIMEOUT = 30000;

  static Dio get() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://www.xx.com/api",
      connectTimeout: CONNECTION_TIMEOUT,
      receiveTimeout: READ_TIMEOUT,
    );
    return new Dio(options);
  }
}