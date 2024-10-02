import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';
import 'package:unsplash_api_app/logic/bloc/collection_bloc/collection_bloc.dart';

class AddCollectionTextField extends StatefulWidget {
  final ImageItems imageItems;
  const AddCollectionTextField({super.key, required this.imageItems});

  @override
  State<AddCollectionTextField> createState() => _AddCollectionTextFieldState();
}

class _AddCollectionTextFieldState extends State<AddCollectionTextField> {
  final TextEditingController collectionNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff3c3d3f),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Create New Collection',
                style: TextStyle(
                    fontSize: 17, color: Colors.white, fontFamily: "Body"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: "Body"),
                controller: collectionNameController,
                cursorColor: Colors.white,
                autofocus: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "Body"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CollectionBloc>().add(
                            AddCollectionEvent(
                              collectionName: collectionNameController.text,
                              imageItems: widget.imageItems,
                            ),
                          );
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              "Added to collection",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Body"),
                            )),
                      );
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: "Body"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
