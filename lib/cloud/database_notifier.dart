import '../app_exporter.dart';
import '../mock/data.dart';
import '../order/order.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _menu = _firestore.collection('menu');
final CollectionReference _orders = _firestore.collection('orders');

final _collectionStreamx = _menu.snapshots();

class DatabaseNotifier extends ChangeNotifier {
  ///[THis is a Stream that Listens to the Menu Collection in the Cloud]
  final menuListProviderx = StreamProvider.autoDispose<List<MenuItem>>((_) {
    return _collectionStreamx.map((QuerySnapshot querySnapshot) => querySnapshot
        .docs
        .map((DocumentSnapshot document) => MenuItem.fromSnapshot(document))
        .toList());
  });

    Future<void>  addMenuItemsToCloud() async {
    for (final menuItem in cloudMenuItems) {
      await addMenuItemToCloud(menuItem);
    }
  }

  Future<void> addMenuItemToCloud(MenuItem menuItem) {
    return _menu.add({
      "id": menuItem.id,
      "name": menuItem.name,
      "imageUrl": menuItem.imageUrl,
      "category": menuItem.category,
      "group": menuItem.group,
      "price": menuItem.price,
    // ignore: avoid_print
    }).then((value) => print('Bag Item ${menuItem.name} uploaded'))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add Order:$error"));
  }

  Future<void> uploadOrderItemfromBagItem({
    required BagItem bagItem,
    required String userId,
  }) {
// 3 Margherita Pizza at UGX 45,000
    final CollectionReference currentOrderDocCollection =
        _orders.doc(userId).collection('orderItems');

    return currentOrderDocCollection
        .add({
          'name': bagItem.name,
          'imageUrl': bagItem.imageUrl,
          'price': bagItem.price,
          'group': bagItem.group,
          'category': bagItem.category,
          'qty': bagItem.qty,
        })
        // ignore: avoid_print
        .then((value) => print('Bag Item ${bagItem.name} uploaded'))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add Order:$error"));
  }

// * Uploading Orders to Cloud

  Future<void> addOrder(Order order) {
    final DocumentReference currentOrderDoc = _orders.doc(order.userId);

    return currentOrderDoc.set({
      'userId': order.userId,
      'userName': order.userName,
      'isServed': order.isServed,
      'userEmail': order.userEmail,
      'currentOrderDate': order.currentOrderDate,
      'dateOfDelivery': order.dateOfDelivery,
      // 'hoursLeft': order.hoursLeft,
      'orderItems': order.orderItems.map((e) => e.toString()).toList(),
      'totalBill': order.totalBill,
    }, SetOptions(merge: true)).then((value) async {});
  }

  Future<void> cancelOrder({required String userId}) async {
    if (_orders.doc(userId).id.isNotEmpty) {
      await _orders
          .doc(userId)
          .delete()
          // ignore: avoid_print
          .then((value) => print("Booking Deleted"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to delete booking: $error"));
    }

    // ignore: avoid_print
    print('Null');
  }
}

///provides a string [DatabaseNotifier]
final cloudDatabaseNotifier =
    ChangeNotifierProvider<DatabaseNotifier>((_) => DatabaseNotifier());
