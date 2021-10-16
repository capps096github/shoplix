import 'package:flutter/cupertino.dart';

import '../app_exporter.dart';
import 'providers.dart';

class FavBottomNavBar extends ConsumerWidget {
  const FavBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final favoritesHive = watch(favoritesProvider);
    return favoritesHive.favoritesBox.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: kalyaFavoritePink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(kalyaFavoritePink),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  onPressed: () {
                    context.read(favoritesProvider).clearFavorites();
                    context.read(isFavoriteScreenProvider).state = false;
                  },
                  icon: const Icon(
                    CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    color: kalyaWhite,
                  ),
                  label: const Text(
                    'Clear Favorites',
                    style: TextStyle(
                      color: kalyaWhite,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
