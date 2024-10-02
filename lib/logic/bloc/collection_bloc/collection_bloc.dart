import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/hive/collections_hive.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionsHive collectionsHive;
  CollectionBloc(this.collectionsHive)
      : super(const CollectionState(collections: [])) {
    on<AddCollectionEvent>(onAddCollectionEvent);
    on<AddImageToCollectionEvent>(onAddImageToCollectionEvent);
    on<RemoveImageFromCollectionEvent>(onRemoveImageFromCollectionEvent);
    on<LoadCollectionsEvent>(onLoadCollectionsEvent);
  }

  Future<void> onAddCollectionEvent(AddCollectionEvent event, emit) async {
    await collectionsHive.addNewCollection(
        event.collectionName, event.imageItems);
    final collections = collectionsHive.collectionList;
    emit(CollectionState(collections: collections));
  }

  Future<void> onAddImageToCollectionEvent(
      AddImageToCollectionEvent event, emit) async {
    collectionsHive.addImageToCollection(
        event.collectionName, event.imageItems);
    final collections = collectionsHive.collectionList;
    emit(CollectionState(collections: collections));
  }

  Future<void> onRemoveImageFromCollectionEvent(
      RemoveImageFromCollectionEvent event, emit) async {
    collectionsHive.removeFromCollection(
        event.collectionName, event.imageItems);
    final collections = collectionsHive.collectionList;
    emit(CollectionState(collections: collections));
  }

  Future<void> onLoadCollectionsEvent(LoadCollectionsEvent event, emit) async {
    final collections = collectionsHive.collectionList;
    emit(CollectionState(collections: collections));
  }
}
