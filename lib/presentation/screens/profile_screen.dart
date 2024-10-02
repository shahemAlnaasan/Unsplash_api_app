import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/favorites_image_grid.dart';

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
          "Your Favorites",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return state.favoriteImages.isEmpty
                ? const Center(
                    child: Text(
                      "No favorites to show",
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey, fontFamily: "Body"),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        FavoritesImageGrid(
                          favoriteImagesList: state.favoriteImages,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
