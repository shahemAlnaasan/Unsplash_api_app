import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionOption extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? color;
  final void Function()? onTap;
  const SectionOption({
    super.key,
    required this.title,
    this.color,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 120.sp,
        height: 40.sp,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: textColor,
              fontFamily: "Body",
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
