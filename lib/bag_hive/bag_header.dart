import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_exporter.dart';
import 'providers.dart';

class BagHeader extends StatelessWidget {
  const BagHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Ionicons.pizza,
            color: shoplixColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: shoplixColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_bag,
                  color: shoplixOrange,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Food & Drinks Bag',
                    style: TextStyle(
                        color: shoplixOrange, fontWeight: FontWeight.w700),
                  ),
                  Consumer(
                    builder: (context, watch, child) {
                      final bagHive = watch(bagHiveProvider);

                      final x =
                          bagHive.totalBagQuantity == 1 ? 'item' : 'items';
                      return bagHive.bagBox.isNotEmpty
                          ? Text(
                              '${bagHive.totalBagQuantity} $x',
                              style: const TextStyle(
                                  color: kalyaOrange50, fontSize: 10),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Ionicons.fast_food_outline,
            color: shoplixColor,
          ),
        ),
      ],
    );
  }
}
