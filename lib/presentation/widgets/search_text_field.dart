import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api_app/logic/bloc/search_image_bloc/search_image_bloc.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? controller;
  const SearchTextField({super.key, this.controller});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(25),
      ),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          controller: widget.controller,
          onFieldSubmitted: (searchText) {
            context
                .read<SearchImageBloc>()
                .add(StartSearchImageEvent(query: searchText));
          },
          focusNode: _focusNode,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Body",
            fontWeight: FontWeight.w400,
          ),
          cursorColor: Colors.black,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 20 / 2, left: 15),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 25, minHeight: 25),
            prefixIcon: _hasFocus
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/icons/search.png",
                      width: 29,
                      height: 29,
                      color: Colors.grey[600],
                    ),
                  ),
            hintText: "Search unlimited photos",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "Body",
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
