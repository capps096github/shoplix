import '../app_exporter.dart';
import 'providers.dart';

const double s = 100;

class ViewRelatedMenuItemsCard extends ConsumerWidget {
  const ViewRelatedMenuItemsCard({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isRelatedItemScreen = watch(isRelatedItemsProvider).state;

    ///[Cloud Database]
    final database = watch(cloudDatabaseNotifier);

    final databaseProvider = watch(database.menuListProviderx);

    final menuListProvider = watch(menuListNotifier);

    ///['s'] provider
    final x = menuItem.category.endsWith('s') ? '' : ' ${menuItem.group}s';
    return InkWell(
      onTap: () =>
          context.read(isRelatedItemsProvider).state = !isRelatedItemScreen,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        color: kalyaOrange50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              tileColor: kalyaBrown900,
              title: Text(
                'View Other ${menuItem.category}$x',
                style: const TextStyle(color: kalyaOrange50),
              ),
              trailing: const Icon(
                Icons.open_in_new_rounded,
                color: kalyaOrange50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: s,
                child: databaseProvider.when(
                    data: (List<MenuItem> menuList) {
                      final isFood = menuItem.group == 'Food';
                      final relatedList = isFood
                          ? menuListProvider.relatedFoodList(
                              menuItems: menuList, food: menuItem)
                          : menuListProvider.relatedDrinksList(
                              menuItems: menuList, drink: menuItem);
                      return menuListProvider.isListLoading
                          ? Container(color: kalyaOrange100)
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                final it = relatedList[index];
                                return RelatedIcon(menuItem: it);
                              },
                              itemCount: relatedList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                            );
                    },
                    loading: () {
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            width: s,
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: kalyaOrange100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      );
                    },
                    error: (error, stackTrace) => Container(color: Colors.red)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RelatedIcon extends StatelessWidget {
  const RelatedIcon({Key? key, required this.menuItem}) : super(key: key);
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(2),
      width: s,
      decoration: BoxDecoration(
        color: kalyaOrange100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          KalyaImage(
            imageUrl: menuItem.imageUrl,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: kalyaBrown900,
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              child: Text(
                menuItem.name,
                maxLines: 1,
                style: const TextStyle(color: kalyaOrange50, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
