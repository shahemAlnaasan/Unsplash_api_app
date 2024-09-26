import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/data/web_services/images_web_services.dart';

class ImagesRepo {
  ImagesWebServices imagesWebServices = ImagesWebServices();

  Future<List<ImageItems>> getRandomImagesRepo() async {
    final images = await imagesWebServices.getRandomImages();

    return images.map((image) => ImageItems.fromJson(image)).toList();
  }
}
