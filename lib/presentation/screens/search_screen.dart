import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/constant/strings.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/loading_indecator.dart';
import 'package:unsplash_api_app/presentation/widgets/search_text_field.dart';
import 'package:unsplash_api_app/presentation/widgets/searched_image_grid.dart';
import 'package:unsplash_api_app/presentation/widgets/suggestion_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<ImageItems> searchedImages = [];

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
      context
          .read<SearchImageBloc>()
          .add(StartSearchImageEvent(query: searchController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              setState(() {
                searchController.text = "";
              });
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white)),
        title: SearchTextField(
          controller: searchController,
        ),
        bottom: PreferredSize(
          preferredSize: Size(100.sp, 50),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: suggestions
                        .map(
                          (suggestion) => GestureDetector(
                            onTap: () {
                              setState(() {
                                searchController.text = suggestion;
                              });
                              context.read<SearchImageBloc>().add(
                                  StartSearchImageEvent(query: suggestion));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child:
                                  SuggestionContainer(suggestion: suggestion),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SearchImageBloc, SearchImageState>(
              builder: (context, state) {
                if (state.status == SearchImagesStatus.success) {
                  searchedImages = state.images;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchedImageGrid(
                          images: searchedImages,
                          state: state,
                        ),
                        const LoadingIndecator(),
                      ],
                    ),
                  );
                } else if (state.status == SearchImagesStatus.loading) {
                  return const SizedBox(
                    width: 400,
                    height: 700,
                    child: Center(
                      child: LoadingIndecator(),
                    ),
                  );
                } else if (state.status == SearchImagesStatus.inital) {
                  return Center(
                    heightFactor: 0.025.sh,
                    child: const Text(
                      "what's on your mind",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: "Body",
                      ),
                    ),
                  );
                } else {
                  return const Text("error");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
