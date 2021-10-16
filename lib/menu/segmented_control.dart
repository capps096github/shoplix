import 'package:flutter/cupertino.dart';

import '../app_exporter.dart';
import 'providers.dart';

const segmentedControlMaxWidth = 550.0;

class MenuControl extends StatelessWidget {
  const MenuControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///items for the Segmented Control
    final children = <int, Widget>{
      0: const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Food Menu'),
      ),
      1: const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Drinks Menu'),
      ),
    };

    return Container(
      constraints: const BoxConstraints(maxWidth: 750),
      width: segmentedControlMaxWidth,
      margin: const EdgeInsets.only(top: 8, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Consumer(
        builder: (context, watch, _) {
          final currentValue = watch(currentMenuIndexProvider).state;
          final isFood = currentValue == 0;

          return CupertinoSegmentedControl<int>(
            padding: const EdgeInsets.all(0),
            selectedColor: shoplixColor,
            children: children,
            pressedColor: shoplixWhite,
            borderColor: shoplixWhite,
            onValueChanged: (int newValue) {
              context.read(currentMenuIndexProvider).state = newValue;
              isFood
                  ? context.read(menuListNotifier).resetFoodCategory()
                  : context.read(menuListNotifier).resetDrinksCategory();
            },
            groupValue: currentValue,
          );
        },
      ),
    );
  }
}
