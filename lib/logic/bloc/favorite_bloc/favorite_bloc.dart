import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState(favoriteImages: [])) {
    on<LoadFavoritesEvent>(onLoadFavorites);
    on<AddToFavoriteEvent>(onAddToFavorite);
    on<RemoveFromFavoriteEvent>(onRemoveFromFavorite);
  }
  Future<void> onAddToFavorite(
      AddToFavoriteEvent event, Emitter<FavoriteState> emit) async {
    var box = await Hive.openBox<ImageItems>('favorites');
    await box.put(event.imageItems.id, event.imageItems);

    final updatedImages = box.values.toList();
    emit(state.copyWith(favoriteImages: updatedImages));
  }

  Future<void> onRemoveFromFavorite(
      RemoveFromFavoriteEvent event, Emitter<FavoriteState> emit) async {
    var box = await Hive.openBox<ImageItems>('favorites');
    await box.delete(event.imageItems.id);

    final updatedImages = box.values.toList();
    emit(state.copyWith(favoriteImages: updatedImages));
  }

  Future<void> onLoadFavorites(LoadFavoritesEvent event, emit) async {
    var box = await Hive.openBox<ImageItems>('favorites');
    final images = box.values.toList();
    emit(FavoriteState(favoriteImages: images));
  }
}
