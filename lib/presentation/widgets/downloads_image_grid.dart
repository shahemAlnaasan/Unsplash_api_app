import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api_app/presentation/screens/image_details_screen.dart';

class DownloadsImageGrid extends StatefulWidget {
  const DownloadsImageGrid({super.key});

  @override
  State<DownloadsImageGrid> createState() => _DownloadsImageGridState();
}

class _DownloadsImageGridState extends State<DownloadsImageGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      itemCount: 10,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     // builder: (context) => const ImageDetailsScreen(imageItems: null,),
            //   ),
            // );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/icons/photo_2024-09-24_21-16-55.jpg',
                  fit: BoxFit.fitWidth,
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
                      child: Image.asset(
                        "assets/icons/Annotation 2024-09-23 141652.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/icons/heart.png",
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Lukas Belsky",
                style: TextStyle(
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
