import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/download_image_bloc/download_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/share_image_bloc/share_image_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/details_screens_upper_bar.dart';
import 'package:unsplash_api_app/presentation/widgets/image_options.dart';
import 'package:unsplash_api_app/presentation/widgets/loading_indecator.dart';
import 'package:unsplash_api_app/presentation/widgets/profile_list_tile.dart';

class ImageDetailsScreen extends StatelessWidget {
  final ImageItems imageItems;
  final int i;
  final String sourcePage;
  const ImageDetailsScreen(
      {super.key,
      required this.imageItems,
      required this.i,
      required this.sourcePage});

  String getHeroTag(String sourcePage) {
    if (sourcePage == "home") {
      return "home_$i";
    } else if (sourcePage == "search") {
      return "search_$i";
    } else if (sourcePage == "collection") {
      return "collection_$i";
    } else {
      return "favorites_$i";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocListener(
        listeners: [
          BlocListener<DownloadImageBloc, DownloadImageState>(
            listener: (context, state) {
              if (state is ImageDownloadSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      )),
                );
              } else if (state is ImageDownloadFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            },
          ),
          BlocListener<ShareImageBloc, ShareImageState>(
            listener: (context, state) {},
          ),
        ],
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Positioned.fill(
                child: BlurHash(
                  hash: imageItems.blurHash,
                  imageFit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 0.1.sh),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        DetailsScreensUpperBar(
                          imageItems: imageItems,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 530,
                          child: Hero(
                            tag: getHeroTag(sourcePage),
                            child: Center(
                              child: IntrinsicHeight(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: CachedNetworkImage(
                                    imageUrl: imageItems.urls.regular,
                                    placeholder: (context, url) =>
                                        const LoadingIndecator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        ImageOptions(imageItems: imageItems),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ProfileListTile(
                      user: imageItems.user,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
