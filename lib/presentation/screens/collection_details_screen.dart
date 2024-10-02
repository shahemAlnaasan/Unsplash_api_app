import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/collection_details_image_grid.dart';

class CollectionDetailsScreen extends StatelessWidget {
  final Collection collection;
  const CollectionDetailsScreen({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          collection.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 20,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CollectionDetailsImageGrid(
                    collection: collection,
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
