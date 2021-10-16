import 'package:flutter/material.dart';

import '../app_exporter.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: AnimatedSwitcher(
        duration: const Duration(microseconds: 500),
        child: Icon(
          isTapped ? Icons.check_circle : Icons.shopping_bag,
          color: kalyaWhite,
          key: Key(
            isTapped ? 'Added to Your Bag' : 'Add to Your Bag',
          ),
        ),
      ),
      onPressed: isTapped
          ? () {}
          : () {
              setState(() {
                isTapped = true;
                // print('Button Tap : $isTapped');
              });

              ///[onTap]
              widget.onTap();
            },
      label: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Text(
          isTapped ? 'Added to Your Bag' : 'Add to Bag',
          key: Key(
            isTapped ? 'Added to Your Bag' : 'Add to Bag',
          ),
          style: TextStyle(
              color: kalyaWhite,
              fontWeight: isTapped ? FontWeight.w900 : FontWeight.normal),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(kalyaBrown900),
      ),
    );
  }
}
