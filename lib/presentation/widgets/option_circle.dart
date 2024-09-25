import 'package:flutter/material.dart';

class OptionCircle extends StatelessWidget {
  final Widget? icon;
  const OptionCircle({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(child: icon),
    );
  }
}
