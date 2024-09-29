import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/download_image_bloc/download_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/images_bloc/images_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/share_image_bloc/share_image_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/image_details_screen.dart';

class ForYouImageGrid extends StatelessWidget {
  final List<ImageItems> images;
  final ScrollController? controller;
  final ImagesState state;
  const ForYouImageGrid(
      {super.key, required this.images, this.controller, required this.state});

  Future<void> preLoadeDetailsImage(BuildContext context, String url) async {
    await precacheImage(CachedNetworkImageProvider(url), context);
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      itemCount: images.length,
      itemBuilder: (context, i) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          preLoadeDetailsImage(context, images[i].urls.regular);
        });
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
                          imageItems: images[i],
                          i: i,
                          sourcePage: 'home',
                        ),
                      )),
            );
          },
          child: Hero(
            tag: "home_$i",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: images[i].urls.small,
                placeholder: (context, url) => AspectRatio(
                  aspectRatio: images[i].width / images[i].height,
                  child: BlurHash(
                    hash: images[i].blurHash,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
