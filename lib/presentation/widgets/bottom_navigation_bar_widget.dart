import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10.0, sigmaY: 10.0, tileMode: TileMode.repeated),
            child: BottomNavigationBar(
              selectedLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 9),
              elevation: 0,
              backgroundColor: const Color.fromARGB(62, 255, 252, 252),
              onTap: (val) {
                setState(() {
                  widget.onIndexChanged(val);
                });
              },
              currentIndex: widget.currentIndex,
              items: [
                buildBottomNavigationBarItem(
                  icon: Image.asset(
                    widget.currentIndex != 0
                        ? "assets/icons/camera.png"
                        : "assets/icons/camera_selected.png",
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                  currentIndex: widget.currentIndex,
                  index: 0,
                ),
                buildBottomNavigationBarItem(
                  icon: Image.asset(
                    widget.currentIndex != 1
                        ? "assets/icons/search.png"
                        : "assets/icons/search_selected.png",
                    width: 27,
                    height: 27,
                    color: Colors.white,
                  ),
                  currentIndex: widget.currentIndex,
                  index: 1,
                ),
                buildBottomNavigationBarItem(
                  icon: widget.currentIndex != 2
                      ? Image.asset(
                          "assets/icons/user.png",
                          width: 28,
                          height: 28,
                          color: Colors.white,
                        )
                      : Image.asset(
                          "assets/icons/user_selected.png",
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                  currentIndex: widget.currentIndex,
                  index: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    {required Widget icon, required int index, required int currentIndex}) {
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        icon,
        const SizedBox(height: 7),
        if (currentIndex == index) ...[
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    ),
    label: '',
  );
}
