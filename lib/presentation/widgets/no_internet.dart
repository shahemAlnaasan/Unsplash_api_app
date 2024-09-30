import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/no-internet.png',
              color: Colors.white,
              width: 45,
              height: 45,
            ),
            const SizedBox(height: 10),
            const Text(
              "It looks as though you're offline.",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Body", fontSize: 15),
            ),
            const Text(
              "You'll see more images when you're back online.",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Body", fontSize: 15),
            ),
          ],
        )),
      ),
    );
  }
}
