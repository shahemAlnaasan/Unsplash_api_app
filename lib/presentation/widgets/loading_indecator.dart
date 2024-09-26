import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  const LoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/icons/Loading.gif",
        width: 50,
        height: 50,
      ),
    );
  }
}
