import '../../app_exporter.dart';
import '../menu_item.dart';

part 'search_item.g.dart';

@HiveType(typeId: 2)
class SearchItem extends HiveObject {
  @HiveField(0)
  final String name;

  ///
  @HiveField(1)
  final String group;

  ///
  @HiveField(2)
  final String category;

  ///
  @HiveField(3)
  final String imageUrl;

  ///
  @HiveField(4)
  final int price;

  ///
  @HiveField(5)
  final int id;

  ///
  @HiveField(6)
  final int qty;

  SearchItem({
    this.qty = 1,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.group,
    required this.category,
  });

  ///Get a bag item with number of items from Menu Item
  factory SearchItem.fromMenuItem({required MenuItem item}) {
    return SearchItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
      qty: 1,
    );
  }

  MenuItem toMenuItem(SearchItem item) {
    return MenuItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
    );
  }

  @override
  String toString() {
    return name;
  }
}
