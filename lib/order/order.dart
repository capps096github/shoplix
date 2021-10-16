import 'package:intl/intl.dart';

import '../app_exporter.dart';

class Order {
  final String userId, userName, userEmail;

  final DateTime currentOrderDate, dateOfDelivery;
  // final int hoursLeft, numOfItems;

  final List<BagItem> orderItems;
  final int totalBill;

  /// this will help us with the boolean where
  /// `0 is False` and `1 is true`
  final int isServed;

  Order({
    required this.isServed,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.currentOrderDate,
    required this.dateOfDelivery,
    required this.orderItems,
    required this.totalBill,
  });

  @override
  String toString() {
    final formatedTimeAndDate =
        DateFormat('EEEEE, dd MMMM yyyy - hh:mm a').format(dateOfDelivery);
    final formatedDate =
        DateFormat('EEEEE, dd MMMM yyyy  hh:mm a').format(currentOrderDate);
    final Duration difference = dateOfDelivery.difference(currentOrderDate);
    final List<String> list = orderItems.map((e) => e.toString()).toList();

    return 'Order -- by  $userId -- $userName -- $userEmail'
        ' \nNumOfItems = ${list.length} :: Bill = $totalBill'
        '\n$list '
        '\nat $formatedDate due on $formatedTimeAndDate --- $difference hours left';
  }
}
