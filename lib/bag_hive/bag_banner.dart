import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_exporter.dart';
import 'providers.dart';

final cx = Colors.brown.shade900;

final bannerContent = [
  'Tap to an Item Increase its Quantity in the Cart',
  'Long Press an Item to Delete it',
];

class BagBanner extends ConsumerWidget {
  const BagBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final showBanner = watch(showBannerProvider).state;

    return showBanner
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: MaterialBanner(
                content: Column(
                  children: [
                    for (var text in bannerContent)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              bannerContent.indexOf(text) == 0
                                  ? CupertinoIcons.hand_draw
                                  : Icons.touch_app_outlined,
                              color: cx,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              text,
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: cx,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              bannerContent.indexOf(text) == 0
                                  ? CupertinoIcons.add
                                  : CupertinoIcons.delete,
                              color: cx,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: cx.withOpacity(0.8),
                  child: const Icon(Icons.info, color: kalyaOrange50),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read(showBannerProvider).state = !showBanner;
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.black,
                    ),
                  ),
                ],
                backgroundColor: kalyaOrange50,
              ),
            ),
          )
        : const SizedBox();
  }
}
