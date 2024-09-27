import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
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
  const ImageDetailsScreen(
      {super.key, required this.imageItems, required this.i});

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
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is ImageDownloadFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
            ),
            BlocListener<ShareImageBloc, ShareImageState>(
              listener: (context, state) {
                if (state is ShareImageSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is ShareImageFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
            ),
          ],
          child: Stack(
            children: [
              Positioned.fill(
                child: BlurHash(
                  hash: imageItems.blurHash,
                  imageFit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
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
                            tag: i,
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
                    ProfileListTile(
                      user: imageItems.user,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
