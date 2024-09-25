import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/presentation/widgets/collection_image_grid.dart';
import 'package:unsplash_api_app/presentation/widgets/for_you_image_grid.dart';
import 'package:unsplash_api_app/presentation/widgets/section_option.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  bool isForYouSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            expandedHeight: 30.0,
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
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ForYouImageGrid(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return const Column(
                            children: [
                              CollectionImageGrid(),
                              SizedBox(height: 23),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
