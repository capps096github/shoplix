import 'package:flutter/material.dart';

class ShoplixLogo extends StatelessWidget {
  const ShoplixLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage("icons/shoplix_black.png"),
        height: 100,
        width: 100,
      ),
    );
  }
}
