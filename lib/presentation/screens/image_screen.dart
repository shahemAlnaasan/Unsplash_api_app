import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/images_bloc/images_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/collection_details_screen.dart';
import 'package:unsplash_api_app/presentation/widgets/collection_image_grid.dart';
import 'package:unsplash_api_app/presentation/widgets/for_you_image_grid.dart';
import 'package:unsplash_api_app/presentation/widgets/loading_indecator.dart';
import 'package:unsplash_api_app/presentation/widgets/section_option.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ScrollController scrollController = ScrollController();
  bool isForYouSelected = true;

  @override
  void initState() {
    scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose;
    super.dispose();
  }

  void onScroll() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.offset;

    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<ImagesBloc>().add(GetImagesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: isForYouSelected ? scrollController : null,
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SectionOption(
                  title: 'Collections',
                  color: isForYouSelected ? Colors.transparent : Colors.white,
                  textColor: isForYouSelected ? Colors.white : Colors.black,
                  onTap: () {
                    setState(
                      () {
                        isForYouSelected = false;
                      },
                    );
                  },
                ),
                SizedBox(width: 16.sp),
                SectionOption(
                  title: 'For You',
                  color: isForYouSelected ? Colors.white : Colors.transparent,
                  textColor: isForYouSelected ? Colors.black : Colors.white,
                  onTap: () {
                    setState(() {
                      isForYouSelected = true;
                    });
                  },
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                isForYouSelected
                    ? BlocBuilder<ImagesBloc, ImagesState>(
                        builder: (context, state) {
                          if (state.status == ImagesStatus.loading) {
                            return const SizedBox(
                              width: 400,
                              height: 700,
                              child: Center(
                                child: LoadingIndecator(),
                              ),
                            );
                          } else if (state.status == ImagesStatus.success) {
                            List<ImageItems> images = state.images;
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, bottom: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ForYouImageGrid(
                                    images: images,
                                    state: state,
                                  ),
                                  const LoadingIndecator(),
                                ],
                              ),
                            );
                          } else {
                            return const Text("error");
                          }
                        },
                      )
                    : BlocBuilder<CollectionBloc, CollectionState>(
                        builder: (context, state) {
                          return state.collections.isEmpty
                              ? SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                  child: const Center(
                                    child: Text(
                                      "No favorites to show",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontFamily: "Body"),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.collections.length,
                                  itemBuilder: (context, i) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CollectionDetailsScreen(
                                                  collection:
                                                      state.collections[i],
                                                ),
                                              ),
                                            );
                                          },
                                          child: CollectionImageGrid(
                                            collection: state.collections[i],
                                          ),
                                        ),
                                        const SizedBox(height: 23),
                                      ],
                                    );
                                  },
                                );
                        },
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
