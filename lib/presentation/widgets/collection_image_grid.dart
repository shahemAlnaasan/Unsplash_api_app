import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';

class CollectionImageGrid extends StatelessWidget {
  final Collection collection;
  const CollectionImageGrid({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: collection.imageItems.isEmpty
                      ? const Color(0xff3c3d3f)
                      : null,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                width: 220.sp,
                height: 220.sp,
                child: collection.imageItems.isNotEmpty
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: collection.imageItems[0].urls.small,
                          placeholder: (context, url) => AspectRatio(
                            aspectRatio: collection.imageItems[0].width /
                                collection.imageItems[0].height,
                            child: BlurHash(
                              hash: collection.imageItems[0].blurHash,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: collection.imageItems.length > 1
                          ? null
                          : const Color(0xff3c3d3f),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: 105.sp,
                    height: 105.sp,
                    child: collection.imageItems.length > 1
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: collection.imageItems[1].urls.small,
                              placeholder: (context, url) => AspectRatio(
                                aspectRatio: collection.imageItems[1].width /
                                    collection.imageItems[1].height,
                                child: BlurHash(
                                  hash: collection.imageItems[1].blurHash,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    decoration: BoxDecoration(
                      color: collection.imageItems.length > 2
                          ? null
                          : const Color(0xff3c3d3f),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    width: 105.sp,
                    height: 105.sp,
                    child: collection.imageItems.length > 2
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: collection.imageItems[2].urls.small,
                              placeholder: (context, url) => AspectRatio(
                                aspectRatio: collection.imageItems[2].width /
                                    collection.imageItems[2].height,
                                child: BlurHash(
                                  hash: collection.imageItems[2].blurHash,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                collection.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Body",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${collection.imageItems.length}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Body",
                    ),
                  ),
                  const Text(
                    " Medias",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Body",
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
