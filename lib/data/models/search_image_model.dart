import 'package:unsplash_api_app/data/models/image_model.dart';

class SearchImageItems {
  late String id;
  late int width;
  late int height;
  late String blurHash;
  late Urls urls;
  late Links links;
  late User user;

  SearchImageItems({
    required this.id,
    required this.width,
    required this.height,
    required this.blurHash,
    required this.urls,
    required this.links,
    required this.user,
  });

  SearchImageItems.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    width = json["width"];
    height = json["height"];
    blurHash = json["blur_hash"];
    urls = Urls.fromJson(json["urls"]);
    links = Links.fromJson(json["links"]);
    user = User.fromJson(json["user"]);
  }
}
