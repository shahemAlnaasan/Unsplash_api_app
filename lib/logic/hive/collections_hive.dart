import 'package:hive/hive.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';

class CollectionsHive {
  final Box<Collection> collectionBox;

  CollectionsHive(this.collectionBox);

  List<Collection> get collectionList => collectionBox.values.toList();

  Future<void> addNewCollection(
      String collectionName, ImageItems imageItems) async {
    final newCollection =
        Collection(name: collectionName, imageItems: [imageItems]);

    await collectionBox.put(collectionName, newCollection);
  }

  Future<void> addImageToCollection(
      String collectionName, ImageItems imageItems) async {
    final collection = collectionBox.get(collectionName);

    if (collection != null) {
      collection.imageItems.add(imageItems);
      await collectionBox.put(collectionName, collection);
    }
  }

  Future<void> removeFromCollection(
      String collectionName, ImageItems imageItems) async {
    final collection = collectionBox.get(collectionName);
    if (collection != null) {
      collection.imageItems.remove(imageItems);
      if (collection.imageItems.isEmpty) {
        collectionBox.delete(collectionName);
      } else {
        await collectionBox.put(collectionName, collection);
      }
    }
  }
}
