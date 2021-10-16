import '../app_exporter.dart';

part 'menu_item.g.dart';

@HiveType(typeId: 0)
class MenuItem extends HiveObject {
  @HiveField(0)
  final String name;

  ///
  @HiveField(1)
  final String imageUrl;

  ///
  @HiveField(2)
  final String category;

  ///Use this for featured products in the app,
  ///this variable can be updated in the cloud too
  @HiveField(3)
  final bool? isFeatured;

  @HiveField(4)
  final int id;

  ///Food or Drink
  @HiveField(5)
  final String group;

  ///
  @HiveField(6)
  final int price;

  MenuItem({
    this.isFeatured,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.group,
    required this.price,
  });

  MenuItem.fromSnapshot(DocumentSnapshot json)
      : this(
          id: json['id']! as int,
          name: json['name']! as String,
          imageUrl: json['imageUrl']! as String,
          category: json['category']! as String,
          group: json['group']! as String,
          price: json['price']! as int,
        );

  @override
  String toString() {
    final menuItem = '\nMenuItem('
        '\nid: $id,'
        "\ngroup: '$group',"
        "\nname: '$name',"
        "\ncategory: '$category',"
        '\nprice: $price,'
        "\nimageUrl:'$imageUrl',"
        '\n),'
        '\n';

    return menuItem;
  }
}
