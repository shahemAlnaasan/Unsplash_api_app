import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/data/web_services/search_image_web_services.dart';

class SearchImageRepo {
  SearchImageWebServices searchImageWebServices = SearchImageWebServices();

  Future<List<ImageItems>> getSearchImageRepo(String query, int page) async {
    final images = await searchImageWebServices.searchPhotos(query, page);

    return images.map((image) => ImageItems.fromJson(image)).toList();
  }
}
