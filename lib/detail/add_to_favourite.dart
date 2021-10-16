import 'package:flutter/material.dart';
import '../favorites/providers.dart';

import '../app_exporter.dart';

class AddToFavorite extends ConsumerWidget {
  const AddToFavorite({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context, watch) {
    final favoritesHive = watch(favoritesProvider);
    final isFav = favoritesHive.isFavorite(menuItem.id);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        color: isFav ? kalyaFavoritePink : kalyaBrown900,
        shape: BoxShape.circle,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: IconButton(
          key: Key('$isFav'),
          onPressed: () => favoritesHive.addItemTofavorites(menuItem),
          color: kalyaWhite,
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline),
        ),
      ),
    );
  }
}
