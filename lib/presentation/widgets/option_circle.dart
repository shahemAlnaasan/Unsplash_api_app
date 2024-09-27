import 'package:flutter/material.dart';

class OptionCircle extends StatelessWidget {
  final Widget? icon;
  final Color? color;
  final void Function()? onTap;
  const OptionCircle({super.key, this.icon, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
