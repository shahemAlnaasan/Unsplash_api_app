import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/presentation/widgets/image_options.dart';
import 'package:unsplash_api_app/presentation/widgets/profile_list_tile.dart';

class ImageDetailsScreen extends StatelessWidget {
  const ImageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBody: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Lukas Belsky",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Body",
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.ios_share_outlined,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    IntrinsicHeight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          "assets/icons/photo_2024-09-24_21-16-55.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const ImageOptions(),
                  ],
                ),
                const ProfileListTile(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
