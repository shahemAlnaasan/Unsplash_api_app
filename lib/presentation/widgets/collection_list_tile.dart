import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/data/models/collection_model.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';

class CollectionListTile extends StatelessWidget {
  final Collection collection;
  final ImageItems imageItems;
  const CollectionListTile(
      {super.key, required this.collection, required this.imageItems});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CollectionBloc>().add(
              AddImageToCollectionEvent(
                  collectionName: collection.name, imageItems: imageItems),
            );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Add to collection",
                style: TextStyle(color: Colors.white),
              )),
        );
      },
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              collection.imageItems[0].urls.small,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          collection.name,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontFamily: 'Body',
          ),
        ),
      ),
    );
  }
}
