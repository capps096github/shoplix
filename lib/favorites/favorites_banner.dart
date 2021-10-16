import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_exporter.dart';
import 'providers.dart';

final bannerContent = [
  'Tap to an Item View its Details',
  'Long Press an Item to remove it from Favorites',
  'Tap the "Clear Favorites" Button to Delete all Favorites'
];

class FavoritesBanner extends ConsumerWidget {
  const FavoritesBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final showBanner = watch(showFavBannerProvider).state;
    final favoritesHive = watch(favoritesProvider);
    return showBanner && favoritesHive.favoritesBox.isNotEmpty
        ? ClipRRect(
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
                                : bannerContent.indexOf(text) == 1
                                    ? Icons.touch_app_outlined
                                    : CupertinoIcons.tornado,
                            color: shoplixFavoritePink,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            text,
                            softWrap: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: shoplixFavoritePink,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            bannerContent.indexOf(text) == 0
                                ? CupertinoIcons.arrow_up_right_square_fill
                                : bannerContent.indexOf(text) == 1
                                    ? CupertinoIcons.delete
                                    : CupertinoIcons.tornado,
                            color: shoplixFavoritePink,
                          ),
                        ),
                      ],
                    )
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read(showFavBannerProvider).state = !showBanner;
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: shoplixFavoritePink,
                  ),
                ),
              ],
              backgroundColor: Colors.white70,
            ),
          )
        : const SizedBox();
  }
}
