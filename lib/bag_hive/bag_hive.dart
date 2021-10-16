import '../../app_exporter.dart';
import '../app_exporter.dart';
import 'bag_item.dart';

class BagHive extends ChangeNotifier {
  final bagBox = Hive.box<BagItem>('bag_items');

  ///This is the list of all `Bag Items Stored in the BagBox`
  List<BagItem> get bagItems => bagBox.values.toList();

  ///[Length od Box Items]
  int get boxLength => bagBox.length;

  BagItem bagItem(int index) => bagBox.getAt(index) as BagItem;

  ///[Adds item to cart and the database too]
  void addItemToBag(BagItem bagItem) {
    if (bagBox.containsKey(bagItem.id)) {
      incrementItemQuantity(bagItem);
    } else {
      bagBox.put(bagItem.id, bagItem);
    }

    notifyListeners();
  }

  ///[Remove item to cart and the database too]
  void removeItemFromBag(int id) {
    bagBox.delete(id);
    notifyListeners();
  }

  ///[Increment item Quantity in cart]
  void incrementItemQuantity(BagItem bagItem) {
    bagBox.put(bagItem.id, BagItem.fromBagItemAndIncrement(item: bagItem));
    notifyListeners();
  }

  ///[Remove item quantity in cart]
  void decrementItemQuantity(BagItem bagItem) {
    bagBox.put(bagItem.id, BagItem.fromBagItemAndDecrement(item: bagItem));
    notifyListeners();
  }

  ///[Clear the cart]
  void clearBag() {
    bagBox.deleteAll(bagBox.keys);
    notifyListeners();
  }

  /// Total number of items in the Bag.
  int get totalBagQuantity {
    return bagBox.values.fold(0, (accumulator, item) {
      return accumulator + item.qty;
      // return accumulator + value;
    });
  }

  /// Totaled prices of the items in the Bag.
  double get totalCost {
    return bagBox.values.fold(0, (extendedPrice, item) {
      return extendedPrice + (item.price * item.qty);
      // return accumulator + value;
    });
  }
}
