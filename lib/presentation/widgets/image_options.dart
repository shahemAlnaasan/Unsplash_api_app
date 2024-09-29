import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/download_image_bloc/download_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/option_circle.dart';

class ImageOptions extends StatelessWidget {
  final ImageItems imageItems;
  const ImageOptions({super.key, required this.imageItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionCircle(
          icon: Image.asset(
            "assets/icons/bookmark.png",
            color: Colors.white,
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 15),
        OptionCircle(
          onTap: () {
            context
                .read<DownloadImageBloc>()
                .add(DownloadEvent(imageUrl: imageItems.urls.full));
          },
          color: Colors.white,
          icon: Image.asset(
            "assets/icons/arrow-down.png",
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 15),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            bool isFavorite = state.favoriteImages.contains(imageItems);

            return OptionCircle(
              onTap: () {
                if (isFavorite == true) {
                  context
                      .read<FavoriteBloc>()
                      .add(RemoveFromFavoriteEvent(imageItems: imageItems));
                } else if (isFavorite == false) {
                  context
                      .read<FavoriteBloc>()
                      .add(AddToFavoriteEvent(imageItems: imageItems));
                }
              },
              icon: Image.asset(
                isFavorite
                    ? "assets/icons/heart_selected.png"
                    : "assets/icons/heart.png",
                color: isFavorite ? Colors.red : Colors.white,
                width: 25,
                height: 25,
              ),
            );
          },
        ),
      ],
    );
  }
}
