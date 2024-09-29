part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({required this.favoriteImages});
  final List<ImageItems> favoriteImages;

  FavoriteState copyWith({
    List<ImageItems>? favoriteImages,
  }) {
    return FavoriteState(
      favoriteImages: favoriteImages ?? this.favoriteImages,
    );
  }

  @override
  List<Object> get props => [favoriteImages];
}
