import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 45,
        height: 45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/icons/Annotation 2024-09-23 141652.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Transform(
        transform: Matrix4.translationValues(-5, 0.0, 0.0),
        child: const Text(
          "Lukas Belsky",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Body",
            fontSize: 20,
          ),
        ),
      ),
      subtitle: Transform(
        transform: Matrix4.translationValues(-5, 0.0, 0.0),
        child: const Text(
          "123 Photos & videos",
          style: TextStyle(
            color: Colors.grey,
            fontFamily: "Body",
            fontSize: 15,
          ),
        ),
      ),
      trailing: Transform(
        transform: Matrix4.translationValues(25.sp, 0, 0),
        child: Container(
          width: 80,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Text(
              "Follow",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Body",
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
