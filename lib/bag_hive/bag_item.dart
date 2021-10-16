import '../../app_exporter.dart';

part 'bag_item.g.dart';

@HiveType(typeId: 1)
class BagItem {
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

  BagItem({
    this.qty = 1,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.group,
    required this.category,
  });

  ///Get a bag item with number of items from Menu Item
  factory BagItem.fromMenuItem({required MenuItem item}) {
    return BagItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
      qty: 1,
    );
  }

  factory BagItem.fromBagItem({required BagItem item}) {
    return BagItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
      qty: item.qty,
    );
  }
  factory BagItem.fromBagItemAndIncrement({required BagItem item}) {
    return BagItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
      qty: item.qty + 1,
    );
  }

  factory BagItem.fromBagItemAndDecrement({required BagItem item}) {
    return BagItem(
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      group: item.group,
      category: item.category,
      id: item.id,
      qty: item.qty - 1,
    );
  }

  @override
  String toString() {
    return '$qty ' + name + ' at ${formatter.format(price * qty)} $imageUrl';
  }
}
