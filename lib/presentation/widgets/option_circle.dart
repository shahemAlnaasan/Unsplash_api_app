import 'package:flutter/material.dart';

class OptionCircle extends StatelessWidget {
  final Widget? icon;
  final Color? color;
  const OptionCircle({super.key, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(child: icon),
    );
  }
}
