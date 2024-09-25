import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_api_app/presentation/widgets/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        title: const SearchTextField(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: Column(
          children: [
            IntrinsicWidth(
              stepWidth: 70.sp,
              child: Container(
                height: 40.sp,
                decoration: BoxDecoration(
                  color: const Color(0xff161616),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Art",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Body",
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
