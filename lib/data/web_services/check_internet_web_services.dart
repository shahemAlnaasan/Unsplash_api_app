import 'package:dio/dio.dart';

class CheckInternetWebServices {
  late Dio dio = Dio();

  Future<bool> hasInternetConnection() async {
    try {
      Response response = await dio.get('https://www.google.com');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
