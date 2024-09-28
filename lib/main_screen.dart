import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/images_bloc/images_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/image_screen.dart';
import 'package:unsplash_api_app/presentation/screens/profile_screen.dart';
import 'package:unsplash_api_app/presentation/screens/search_screen.dart';
import 'package:unsplash_api_app/presentation/widgets/bottom_navigation_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  static List<Widget> navigationBarScreens = [
    BlocProvider(
      create: (context) => ImagesBloc()..add(GetImagesEvent()),
      child: const ImageScreen(),
    ),
    BlocProvider(
      create: (context) => SearchImageBloc(),
      child: const SearchScreen(),
    ),
    const ProfileScreen(),
  ];

  void onIndexChanged(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onIndexChanged: onIndexChanged,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: navigationBarScreens,
        ));
  }
}
