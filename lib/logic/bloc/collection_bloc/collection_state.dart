part of 'collection_bloc.dart';

 class CollectionState extends Equatable {
  final List<Collection> collections;

  const CollectionState({required this.collections});

  @override
  List<Object> get props => [collections];
}
