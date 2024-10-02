part of 'collection_bloc.dart';

class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class AddCollectionEvent extends CollectionEvent {
  final String collectionName;
  final ImageItems imageItems;

  const AddCollectionEvent({
    required this.collectionName,
    required this.imageItems,
  });

  @override
  List<Object> get props => [collectionName, imageItems];
}

class AddImageToCollectionEvent extends CollectionEvent {
  final String collectionName;
  final ImageItems imageItems;

  const AddImageToCollectionEvent(
      {required this.collectionName, required this.imageItems});

  @override
  List<Object> get props => [collectionName, imageItems];
}

class RemoveImageFromCollectionEvent extends CollectionEvent {
  final String collectionName;
  final ImageItems imageItems;

  const RemoveImageFromCollectionEvent(
      {required this.collectionName, required this.imageItems});

  @override
  List<Object> get props => [collectionName, imageItems];
}

class LoadCollectionsEvent extends CollectionEvent {}
