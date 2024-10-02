import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';
import 'package:unsplash_api_app/presentation/widgets/add_collection_list_tile.dart';
import 'package:unsplash_api_app/presentation/widgets/collection_list_tile.dart';

class CustomBottomSheet extends StatefulWidget {
  final ImageItems imageItems;
  const CustomBottomSheet({super.key, required this.imageItems});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/icons/Rectangle.png",
            width: 40,
            height: 40,
          ),
          const Text(
            "Save to",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontFamily: 'Body',
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            height: 40,
          ),
          AddCollectionListTile(
            imageItems: widget.imageItems,
          ),
          BlocBuilder<CollectionBloc, CollectionState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.collections.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      CollectionListTile(
                        collection: state.collections[i],
                        imageItems: widget.imageItems,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
