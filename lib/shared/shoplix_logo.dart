import 'package:flutter/material.dart';

class ShoplixLogo extends StatelessWidget {
  const ShoplixLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage("icons/shoplix_blue.png"),
        height: 56,
        width: 135,
      ),
    );
  }
}




