import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, required this.of}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: of,
    );
  }
}
class HorizintalSpacing extends StatelessWidget {
  final double of;

  const HorizintalSpacing({Key? key, required this.of}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of,
    );
  }
}
