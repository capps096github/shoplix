import '../app_exporter.dart';

import 'item_image.dart';
import 'item_name_price.dart';
import 'related_items_cloud_card.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ItemImage(menuItem: menuItem),
          ItemNamePrice(menuItem: menuItem),
          ViewRelatedMenuItemsCard(menuItem: menuItem),
        ],
      ),
    );
  }
}
