import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:unsplash_api_app/data/web_services/check_internet_web_services.dart';
import 'package:unsplash_api_app/logic/bloc/internet_bloc/internet_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/search_image_bloc/search_image_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/images_bloc/images_bloc.dart';
import 'package:unsplash_api_app/presentation/screens/image_screen.dart';
import 'package:unsplash_api_app/presentation/screens/profile_screen.dart';
import 'package:unsplash_api_app/presentation/screens/search_screen.dart';
import 'package:unsplash_api_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:unsplash_api_app/presentation/widgets/no_internet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CheckInternetWebServices checkInternetWebServices =
      CheckInternetWebServices();
  bool hasInternet = true;

  Future<void> checkInternetStatus() async {
    bool result = await checkInternetWebServices.hasInternetConnection();
    setState(() {
      hasInternet = result;
    });
  }

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

  static List<Widget> noInternet = [
    const NoInternet(),
    const NoInternet(),
    const NoInternet(),
  ];

  void onIndexChanged(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  void initState() {
    checkInternetStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onIndexChanged: onIndexChanged,
        ),
        body: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is ConnectedState) {
              checkInternetStatus();
            } else if (state is NotConnectedState) {
              checkInternetStatus();
            }
          },
          child: IndexedStack(
            index: _currentIndex,
            children: hasInternet ? navigationBarScreens : noInternet,
          ),
        ));
  }
}
