import 'package:flutter/foundation.dart';

import '../../app_exporter.dart';
import '../loading_menu_item.dart';
import '../menu_item_card.dart';
import '../providers.dart';

class DrinkCloudBody extends ConsumerWidget {
  const DrinkCloudBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final database = watch(cloudDatabaseNotifier);

    final databaseProvider = watch(database.menuListProviderx);

    final menuListProvider = watch(menuListNotifier);

    return databaseProvider.when(
        data: (List<MenuItem> menuList) {
          if (menuList.isEmpty) {
            return const SliverFillRemaining(
             child: Center(
                child: Text("Not Available"),
              ),
            );
          }
          final gridList =
              menuListProvider.loadDrinkItemsFromList(menuItems: menuList);
          final isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
          final columnCount = isLandscape ? 4 : 2;

          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3 / 4.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: menuListProvider.isListLoading
                        ? const LoadingMenuItem()
                        : MenuItemCard(menuItem: gridList[index]),
                  );
                },
                childCount: gridList.length,
              ),
            ),
          );
        },
        loading: () => const SliverFillRemaining(
              child: Center(
                  child: CircularProgressIndicator(color: shoplixColor)),
            ),
        error: (error, stackTrace) =>
            SliverFillRemaining(child: Container(color: Colors.red)));
  }
}
