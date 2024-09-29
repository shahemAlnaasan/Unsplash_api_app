import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/observer/bloc_observer.dart';
import 'package:unsplash_api_app/main_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(ImageItemsAdapter());
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(LinksAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProfileImageAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => FavoriteBloc()..add(LoadFavoritesEvent()),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          ),
        );
      },
    );
  }
}
