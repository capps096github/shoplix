import 'package:flutter/cupertino.dart';
import '../order.dart';

import '../../app_exporter.dart';

const _name = "FirebaseAuth.instance.currentUser!.displayName!";
const _email = "FirebaseAuth.instance.currentUser!.email!";
const _uid = "FirebaseAuth.instance.currentUser!.uid";

class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({
    Key? key,
    required this.isConfirmed,
  }) : super(key: key);

  final bool isConfirmed;

  @override
  Widget build(BuildContext context, watch) {
    final isUploadingOrder = watch(isUploadingOrderProvider).state;

    return isUploadingOrder
        ? const CircularProgressIndicator()
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: TextButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  isConfirmed ? Colors.green : kalyaBrown900,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              onPressed: isConfirmed
                  ? () {}
                  : () async {
                      // *set to true
                      context.read(isUploadingOrderProvider).state = true;

                      final orderTimeAndDate = watch(orderTimeAndDateProvider);
                      final currentTimeAndDate =
                          watch(currentTimeAndDateProvider);
                      // final Duration difference =
                      //     orderTimeAndDate.difference(currentTimeAndDate);

                      final database = watch(cloudDatabaseNotifier);
                      final bagHive = watch(bagHiveProvider);

                      final order = Order(
                        userId: _uid,
                        isServed: 0,
                        userName: _name,
                        userEmail: _email,
                        currentOrderDate: currentTimeAndDate,
                        dateOfDelivery: orderTimeAndDate,
                        // hoursLeft: difference.inHours,
                        // numOfItems: bagHive.totalBagQuantity,
                        orderItems: bagHive.bagItems,
                        totalBill: bagHive.totalCost.toInt(),
                      );

                      // print(order.toString());
                      await database.addOrder(order);

//* set uploading to false
                      context.read(isUploadingOrderProvider).state = false;

// * set is confirmed to true
                      context.read(isOrderConfirmedProvider).state =
                          !isConfirmed;

                      await showGoodToast(
                        context: context,
                        goodText:
                            'Check Your Email for details about your Order',
                      );
                    },
              icon: Icon(
                  isConfirmed
                      ? Icons.verified
                      : CupertinoIcons.square_fill_line_vertical_square_fill,
                  color: isConfirmed ? kalyaWhite : kalyaOrange50),
              label: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: isConfirmed
                    ? const Text(
                        'Your Order has Been Placed',
                        style: TextStyle(
                          color: kalyaWhite,
                          fontWeight: FontWeight.w900,
                        ),
                        key: ValueKey('confirmed'),
                      )
                    : const Text(
                        'Confirm Order',
                        style: TextStyle(
                          color: kalyaOrange50,
                          fontWeight: FontWeight.w900,
                        ),
                        key: ValueKey('confirm'),
                      ),
              ),
            ),
          );
  }
}
