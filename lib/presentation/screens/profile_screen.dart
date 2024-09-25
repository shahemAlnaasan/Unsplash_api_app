import 'package:flutter/material.dart';
import 'package:unsplash_api_app/presentation/widgets/downloads_image_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Your Downloads",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 20,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 20),
            DownloadsImageGrid(),
          ],
        ),
      ),
    );
  }
}
