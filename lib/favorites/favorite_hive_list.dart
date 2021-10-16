import '../app_exporter.dart';
import 'favorites_list_item.dart';
import 'providers.dart';

class FavoriteHiveList extends ConsumerWidget {
  const FavoriteHiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final animatedListKey = GlobalKey<AnimatedListState>();
    final favoritesHive = watch(favoritesProvider);
    final isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    final columnCount = isLandscape ? 3 : 2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3 / 4.5,
      ),
      key: animatedListKey,
      itemBuilder: (context, index) {
        final favMenuItem = favoritesHive.favoritesItem(index);
        return FavoritesListItem(menuItem: favMenuItem);
      },
      physics: const BouncingScrollPhysics(),
      itemCount: favoritesHive.boxLength,
    );
  }
}
