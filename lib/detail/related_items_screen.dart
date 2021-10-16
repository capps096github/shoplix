/* import 'package:flutter/scheduler.dart';
import 'package:kalya_courts/menu/loading_menu_item.dart';

import '../app_exporter.dart';
import 'related_product_card.dart';

class RelatedItemsScreen extends ConsumerWidget {
  const RelatedItemsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    timeDilation = 3;

    ///[Current Menu List]
    final currentList = watch(currentMenuListProvider);

    ///[Menu List]
    final menuListProvider = watch(menuListNotifier);

    final relatedList =
        menuListProvider.loadRelatedMenuItemsFromList(currentList);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        key: Key('${menuListProvider.selectedCategory}'),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        itemCount: relatedList.length,
        itemBuilder: (context, index) {
          final product = relatedList[index];
          return menuListProvider.isListLoading
              ? LoadingMenuItem()
              : RelatedProductsCard(
                  product: product,
                );
         
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? .8 : 1);
        },
      ),
    );
  }
}

 */
