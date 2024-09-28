import 'package:dio/dio.dart';
import 'package:unsplash_api_app/constant/strings.dart';

class SearchImageWebServices {
  final Dio dio = Dio();

  Future<List<dynamic>> searchPhotos(String query, int page) async {
    try {
      Response response = await dio.get(
        searchBaseUrl,
        queryParameters: {'query': query, 'per_page': 15, 'page': page},
        options: Options(
          headers: {
            'Authorization': 'Client-ID $accessKey',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data['results'];
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
