import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
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
      body: Stack(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Text(
                          "Lukas Belsky",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Body",
                            fontSize: 20,
                          ),
                        ),
                        const Icon(
                          Icons.ios_share_outlined,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
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
                    const ImageOptions(),
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
    );
  }
}
