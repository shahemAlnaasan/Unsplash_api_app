import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/download_image_bloc/download_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/share_image_bloc/share_image_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/image_details_screen.dart';

class FavoritesImageGrid extends StatefulWidget {
  final List<ImageItems> favoriteImagesList;
  const FavoritesImageGrid({super.key, required this.favoriteImagesList});

  @override
  State<FavoritesImageGrid> createState() => _FavoritesImageGridState();
}

class _FavoritesImageGridState extends State<FavoritesImageGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      itemCount: widget.favoriteImagesList.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => DownloadImageBloc(),
                          ),
                          BlocProvider(
                            create: (context) => ShareImageBloc(),
                          )
                        ],
                        child: ImageDetailsScreen(
                          imageItems: widget.favoriteImagesList[i],
                          i: i,
                          sourcePage: 'favorites',
                        ),
                      )),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "favorite_$i",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.favoriteImagesList[i].urls.small,
                    placeholder: (context, url) => AspectRatio(
                      aspectRatio: widget.favoriteImagesList[i].width /
                          widget.favoriteImagesList[i].height,
                      child: BlurHash(
                        hash: widget.favoriteImagesList[i].blurHash,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        widget.favoriteImagesList[i].user.profileImage.small,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      bool isFavorite = state.favoriteImages
                          .contains(widget.favoriteImagesList[i]);

                      return GestureDetector(
                        onTap: () {
                          if (isFavorite) {
                            context.read<FavoriteBloc>().add(
                                RemoveFromFavoriteEvent(
                                    imageItems: widget.favoriteImagesList[i]));
                          } else if (isFavorite == false) {
                            context.read<FavoriteBloc>().add(AddToFavoriteEvent(
                                imageItems: widget.favoriteImagesList[i]));
                          }
                          ;
                        },
                        child: Image.asset(
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
              ),
              const SizedBox(height: 5),
              Text(
                widget.favoriteImagesList[i].user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Body",
                  fontSize: 15,
                ),
              ),
              const Text(
                "+ Follow",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Body",
                  fontSize: 15,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
