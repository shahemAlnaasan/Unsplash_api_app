import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionImageGrid extends StatelessWidget {
  const CollectionImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 220.sp,
                height: 220.sp,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icons/photo_2024-09-24_21-16-55.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 105.sp,
                    height: 105.sp,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/icons/Annotation 2024-09-23 144704.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  SizedBox(
                    width: 105.sp,
                    height: 105.sp,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/icons/Annotation 2024-09-23 144704.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "People",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Body",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "300 Media",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Body",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
