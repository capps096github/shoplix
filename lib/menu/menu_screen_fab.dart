import 'package:flutter/cupertino.dart';

import '../app_exporter.dart';

class MenuScreenFAB extends StatelessWidget {
  const MenuScreenFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  OpenContainer(
        openBuilder: (context, _) => const BagHiveScreen(),
        openColor: shoplixColor,
        closedBuilder: (context, openContainer) {
          return Tooltip(
            message: 'Shopping Bag',
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: shoplixColor.withOpacity(.8),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FloatingActionButton(
              onPressed: openContainer,
              elevation: 6,
              child: BagItemsBadge(
                child: Consumer(
                  builder: (context, watch, child) {
                    final bagHive = watch(bagHiveProvider);
                    final icon = bagHive.bagBox.isEmpty
                        ? CupertinoIcons.bag
                        : CupertinoIcons.bag_fill;
                    return Icon(
                      icon,
                      color: shoplixOrange,
                    );
                  },
                ),
              ),
              backgroundColor: shoplixColor,
              splashColor: Colors.white70,
            ),
          );
        },
        closedShape: const CircleBorder(),
        closedElevation: 6,
        closedColor: shoplixColor,
        transitionType: ContainerTransitionType.fade,
    );
  }
}
