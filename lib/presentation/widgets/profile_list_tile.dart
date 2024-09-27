import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/data/models/image_model.dart';

class ProfileListTile extends StatefulWidget {
  final User user;

  const ProfileListTile({super.key, required this.user});

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl: widget.user.profileImage.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Transform(
        transform: Matrix4.translationValues(-5, 0.0, 0.0),
        child: Text(
          widget.user.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 18,
          ),
        ),
      ),
      subtitle: Transform(
        transform: Matrix4.translationValues(-5, 0.0, 0.0),
        child: Text(
          widget.user.bio ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: "Body",
            fontSize: 15,
          ),
        ),
      ),
      trailing: Transform(
        transform: Matrix4.translationValues(25.sp, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isFollowed = !isFollowed;
            });
          },
          child: Container(
            width: 80,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                isFollowed == false ? "Follow" : "Following",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Body",
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
