import 'package:dio/dio.dart';
import 'package:unsplash_api_app/constant/strings.dart';

class ImagesWebServices {
  late Dio dio;

  ImagesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getRandomImages() async {
    try {
      Response response =
          await dio.get("photos/random?count=14&client_id=$accessKey");
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
