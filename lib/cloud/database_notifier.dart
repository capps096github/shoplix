import '../order/order.dart';

import '../app_exporter.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final CollectionReference _menu = _firestore.collection('menu');
final CollectionReference _orders = _firestore.collection('orders');

final _collectionStreamx = _menu.snapshots();
// final _collectionStream = _menu.get();

class DatabaseNotifier extends ChangeNotifier {
  ///[THis is a Stream that Listens to the Menu Collection in the Cloud]
  final menuListProviderx = StreamProvider.autoDispose<List<MenuItem>>((_) {
    return _collectionStreamx.map((QuerySnapshot querySnapshot) => querySnapshot
        .docs
        .map((DocumentSnapshot document) => MenuItem.fromSnapshot(document))
        .toList());
  });

  // final menuListFutureProvider = FutureProvider<List<MenuItem>>((ref) async {
  //   return await _collectionStream.then((QuerySnapshot querySnapshot) =>
  //       querySnapshot.docs.map((DocumentSnapshot document) {
  //         final item = MenuItem.fromSnapshot(document);

  //         print(item.toString());
  //         return item;
  //       }).toList());
  // });

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
    }, SetOptions(merge: true)).then((value) async {
      // await uploadOrderItemsToCloud(
      //   orderItems: order.orderItems,
      //   userId: order.userId,
      // );
      // print("Order Added");
    });
  }

  // Future uploadOrderItemsToCloud({
  //   required List<BagItem> orderItems,
  //   required String userId,
  // }) async {
  //   for (final bagItem in orderItems)
  //     await uploadOrderItemfromBagItem(
  //       bagItem: bagItem,
  //       userId: userId,
  //     );
  // }

//   Future<void> uploadOrderItemfromBagItem({
//     required BagItem bagItem,
//     required String userId,
//   }) {
// // 3 Margherita Pizza at UGX 45,000
//     final CollectionReference currentOrderDocCollection =
//         _orders.doc(userId).collection('orderItems');

//     return currentOrderDocCollection
//         .add({
//           'name': bagItem.name,
//           'imageUrl': bagItem.imageUrl,
//           'price': bagItem.price,
//           'group': bagItem.group,
//           'category': bagItem.category,
//           'qty': bagItem.qty,
//         })
//         .then((value) => print('Bag Item ${bagItem.name} uploaded'))
//         .catchError((error) => print("Failed to add Order:$error"));
//   }

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

