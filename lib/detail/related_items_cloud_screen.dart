import '../menu/loading_menu_item.dart';

import '../app_exporter.dart';
import 'related_product_card.dart';

class RelatedItemsCloudScreen extends ConsumerWidget {
  const RelatedItemsCloudScreen({
    required this.menuItem,
    Key? key,
  }) : super(key: key);
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final database = watch(cloudDatabaseNotifier);

    final databaseProvider = watch(database.menuListProviderx);

    final menuListProvider = watch(menuListNotifier);

    return databaseProvider.when(
        data: (List<MenuItem> menuList) {
          final isFood = menuItem.group == 'Food';
          final relatedList = isFood
              ? menuListProvider.relatedFoodList(
                  menuItems: menuList, food: menuItem)
              : menuListProvider.relatedDrinksList(
                  menuItems: menuList, drink: menuItem);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              itemCount: relatedList.length,
              itemBuilder: (context, index) {
                final product = relatedList[index];
                return menuListProvider.isListLoading
                    ? const LoadingMenuItem()
                    : RelatedProductsCard(product: product);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.count(1, .8),
            ),
          );
        },
        loading: () => const Center(
            child: CircularProgressIndicator(color: kalyaBrown900)),
        error: (error, stackTrace) => Container(color: Colors.red));
  }
}
