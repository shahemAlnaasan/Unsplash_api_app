import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/download_image_bloc/download_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/share_image_bloc/share_image_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/image_details_screen.dart';

class CollectionDetailsImageGrid extends StatefulWidget {
  final Collection collection;
  const CollectionDetailsImageGrid({super.key, required this.collection});

  @override
  State<CollectionDetailsImageGrid> createState() =>
      _CollectionDetailsImageGridState();
}

class _CollectionDetailsImageGridState
    extends State<CollectionDetailsImageGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      itemCount: widget.collection.imageItems.length,
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
                    imageItems: widget.collection.imageItems[i],
                    i: i,
                    sourcePage: 'collection',
                  ),
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "collection_$i",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.collection.imageItems[i].urls.small,
                    placeholder: (context, url) => AspectRatio(
                      aspectRatio: widget.collection.imageItems[i].width /
                          widget.collection.imageItems[i].height,
                      child: BlurHash(
                        hash: widget.collection.imageItems[i].blurHash,
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
                        widget.collection.imageItems[i].user.profileImage.small,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<CollectionBloc>().add(
                                RemoveImageFromCollectionEvent(
                                  collectionName: widget.collection.name,
                                  imageItems: widget.collection.imageItems[i],
                                ),
                              );
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.collection.imageItems[i].user.name,
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
