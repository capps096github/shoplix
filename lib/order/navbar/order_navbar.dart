import 'package:flutter/cupertino.dart';
import '../order_confirmed_provider.dart';

import '../../app_exporter.dart';
import 'confirm_button.dart';
import 'select_date_time_navbar.dart';

class OrderNavBar extends ConsumerWidget {
  const OrderNavBar({
    Key? key,
  }) : super(key: key);

// !Create this as a global provider variable
  @override
  Widget build(BuildContext context, watch) {
    bool isConfirmed = watch(isOrderConfirmedProvider).state;
    final isTimeDateSet = watch(isTimeDateSetProvider).state;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isTimeDateSet ? kalyaOrange50 : shoplixColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTimeDateSet)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(bottom: 4),
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: isConfirmed ? Colors.green : shoplixColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: !isTimeDateSet
                  ? const SelectDateTimeNavBar()
                  : ConfirmButton(isConfirmed: isConfirmed),
            ),
            if (isConfirmed)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                child: DialogButton(
                  textColor: shoplixWhite,
                  buttonColor: shoplixRed,
                  icon: CupertinoIcons.bag_fill_badge_minus,
                  text: 'Cancel Order',
                  onTap: () async {
                    final database = watch(cloudDatabaseNotifier);
                    // final _uid = FirebaseAuth.instance.currentUser!.uid;

                    await database.cancelOrder(userId: "_uid");

                    Navigator.of(context).pop();
                  },
                  // onTap: () {
                  //   final bagHive = watch(bagHiveProvider);

                  //   bagHive.clearBag();
                  //   Navigator.of(context).pop();
                  // }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
