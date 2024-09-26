import 'package:flutter/material.dart';
import 'package:unsplash_api_app/presentation/widgets/option_circle.dart';

class ImageOptions extends StatelessWidget {
  const ImageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionCircle(
          icon: Image.asset(
            "assets/icons/bookmark.png",
            color: Colors.white,
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 15),
        OptionCircle(
          color: Colors.white,
          icon: Image.asset(
            "assets/icons/arrow-down.png",
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 15),
        OptionCircle(
          icon: Image.asset(
            "assets/icons/heart.png",
            color: Colors.white,
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}
