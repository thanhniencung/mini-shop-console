import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapiAPI {
  static int connectionTimeout = 10000;
  static int readTimeout = 30000;

  static Dio get() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://chapi/api/v1",
      connectTimeout: connectionTimeout,
      receiveTimeout: readTimeout,
    );

    Dio dio = new Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(Options options) async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = prefs.get("user");
          if (token != null) {
            options.headers["token"] = token;
          }
          return options;
        }
    ));

    return dio;
  }
}