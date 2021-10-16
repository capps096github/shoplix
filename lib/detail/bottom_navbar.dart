import '../app_exporter.dart';
import 'add_to_cart_button.dart';
import 'add_to_favourite.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
    required this.menuItem,
  }) : super(key: key);
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bagHive = watch(bagHiveProvider);
    return Container(
      height: kToolbarHeight,
      color: Colors.transparent,
      child: PaddedRow(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: AddToCartButton(
              onTap: () =>
                  bagHive.addItemToBag(BagItem.fromMenuItem(item: menuItem)),
            ),
          ),
          AddToFavorite(menuItem: menuItem),
        ],
      ),
    );
  }
}
