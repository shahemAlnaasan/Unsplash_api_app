import 'package:hive/hive.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';

part 'collection_model.g.dart';

@HiveType(typeId: 5)
class Collection {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<ImageItems> imageItems;

  Collection({required this.name, required this.imageItems});
}
