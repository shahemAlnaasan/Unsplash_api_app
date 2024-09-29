part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavoriteEvent extends FavoriteEvent {
  final ImageItems imageItems;

  const AddToFavoriteEvent({required this.imageItems});

  @override
  List<Object> get props => [imageItems];
}

class RemoveFromFavoriteEvent extends FavoriteEvent {
  final ImageItems imageItems;

  const RemoveFromFavoriteEvent({required this.imageItems});

  @override
  List<Object> get props => [imageItems];
}

class LoadFavoritesEvent extends FavoriteEvent {}
