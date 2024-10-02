import 'package:flutter/material.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/presentation/widgets/add_collection_text_field.dart';

class AddCollectionListTile extends StatelessWidget {
  final ImageItems imageItems;
  const AddCollectionListTile({super.key, required this.imageItems});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return AddCollectionTextField(
              imageItems: imageItems,
            );
          },
        );
      },
      child: const ListTile(
        leading: Icon(
          Icons.add,
          color: Colors.white,
        ),
        title: Text(
          "New Collection",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
