import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../../../favorites/providers.dart';

import '../../../app_exporter.dart';
import '../../menu_item.dart';
import '../recent_searches.dart';

class RecentsList extends StatelessWidget {
  const RecentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kalyaOrange100,
      child: Consumer(
        builder: (context, watch, _) {
          final favoritesHive = watch(favoritesProvider);
          final recentsHive = watch(recentSearchesProvider);
          final favs =
              favoritesHive.boxLength > 5 ? 5 : favoritesHive.boxLength;
          final recents = recentsHive.boxLength > 5 ? 5 : recentsHive.boxLength;

          final showFavs = favoritesHive.favoritesBox.isNotEmpty;
          final showRecents = recentsHive.recentSearchesBox.isNotEmpty;
          return ExpandedScrollingColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showRecents) const _SectionHeader(title: 'RECENT SEARCHES'),
              if (showRecents)
                ...List.generate(
                  recents,
                  (index) {
                    final recentMenuItem = recentsHive.recentSearchItem(index);

                    return _SearchHistoryTile(
                      searchItem: recentMenuItem.toMenuItem(recentMenuItem),
                      showIcon: true,
                    );
                  },
                ),

              ///[Show Favorites]
              if (showFavs)
                const _SectionHeader(
                  title: 'SEARCH FROM FAVORITES',
                ),
              if (showFavs)
                ...List.generate(
                  favs,
                  (index) {
                    final favMenuItem = favoritesHive.favoritesItem(index);

                    return _SearchHistoryTile(
                      searchItem: favMenuItem,
                    );
                    // return FavoritesListItem(menuItem: favMenuItem);
                  },
                ),
              if (!showRecents && !showFavs)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.manage_search_rounded,
                      size: 100,
                      color: kalyaBrown900,
                    ),
                  ),
                ),
              if (!showRecents && !showFavs)
                Container(
                  key: const Key('image-text'),
                  child: Center(
                    child: Text(
                      'Search a Food or Drink Here',
                      style: TextStyles.callout1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    Key? key,
    required this.title,
    this.titleColor = kalyaBrown900,
  }) : super(key: key);
  final String title;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        top: 16,
        bottom: 16,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: titleColor,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
      ),
    );
  }
}

class _SearchHistoryTile extends StatelessWidget {
  const _SearchHistoryTile({
    Key? key,
    required this.searchItem,
    this.showIcon = false,
  }) : super(key: key);
  final MenuItem searchItem;

  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return OpenDetail(
      menuItem: searchItem,
      child: ListTile(
        leading: const Icon(
          Icons.saved_search_rounded,
          color: kalyaBrown900,
        ),
        title: Text(searchItem.name),
        subtitle: Text(
          '${searchItem.category} • Category',
          style: const TextStyle(color: kalyaBrown900),
        ),
        trailing: showIcon
            ? IconButton(
                onPressed: () => context
                    .read(recentSearchesProvider)
                    .removeItemFromrecentSearches(searchItem.id),
                icon: const Icon(
                  Icons.close,
                  color: kalyaBrown900,
                ),
              )
            : null,
      ),
    );
  }
}
