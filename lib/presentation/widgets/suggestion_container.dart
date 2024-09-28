import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionContainer extends StatelessWidget {
  final String suggestion;
  const SuggestionContainer({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: 70.sp,
      child: Container(
        height: 40.sp,
        decoration: BoxDecoration(
          color: const Color(0xff161616),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            suggestion,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Body",
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
