import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api_app/presentation/screens/image_details_screen.dart';

class ForYouImageGrid extends StatelessWidget {
  const ForYouImageGrid({super.key});

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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ImageDetailsScreen(),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/icons/photo_2024-09-24_21-16-55.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      },
    );
  }
}
