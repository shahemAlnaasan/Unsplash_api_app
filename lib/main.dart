import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/internet_bloc/internet_bloc.dart';
import 'package:unsplash_api_app/logic/hive/collections_hive.dart';
import 'package:unsplash_api_app/observer/bloc_observer.dart';
import 'package:unsplash_api_app/main_screen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);

  Hive.registerAdapter(CollectionAdapter());
  Hive.registerAdapter(ImageItemsAdapter());
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(LinksAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProfileImageAdapter());

  final collectionBox = await Hive.openBox<Collection>("collections");
  final CollectionsHive collectionsHive = CollectionsHive(collectionBox);

  runApp(MyApp(collectionsHive: collectionsHive));
}

class MyApp extends StatelessWidget {
  final CollectionsHive collectionsHive;
  const MyApp({super.key, required this.collectionsHive});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FavoriteBloc()..add(LoadFavoritesEvent()),
            ),
            BlocProvider(
              create: (context) => InternetBloc(),
            ),
            BlocProvider(
              create: (context) =>
                  CollectionBloc(collectionsHive)..add(LoadCollectionsEvent()),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          ),
        );
      },
    );
  }
}
