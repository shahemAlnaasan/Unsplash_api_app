import 'package:flutter/material.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';

class DetailsScreensUpperBar extends StatefulWidget {
  final ImageItems imageItems;
  const DetailsScreensUpperBar({super.key, required this.imageItems});

  @override
  State<DetailsScreensUpperBar> createState() => _DetailsScreensUpperBarState();
}

class _DetailsScreensUpperBarState extends State<DetailsScreensUpperBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        Text(
          widget.imageItems.user.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 20,
          ),
        ),
        const Icon(
          Icons.ios_share_outlined,
          color: Colors.white,
          size: 25,
        )
      ],
    );
  }
}
