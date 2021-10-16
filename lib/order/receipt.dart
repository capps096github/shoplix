import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../app_exporter.dart';
import 'exporter.dart';
import 'order_clipper.dart';
import 'order_items.dart';
import 'widgets/bold_text.dart';
import 'widgets/receipt_text.dart';

const double _imageHeight = 54;
const _name = "_user.displayName";

class Receipt extends ConsumerWidget {
  const Receipt({
    Key? key,
    required this.c,
    required this.c2,
  }) : super(key: key);

  final Color c;
  final Color c2;

  @override
  Widget build(BuildContext context, watch) {
    final orderTimeAndDate = watch(orderTimeAndDateProvider);
    final currentTimeAndDate = watch(currentTimeAndDateProvider);
    final Duration difference = orderTimeAndDate.difference(currentTimeAndDate);
    final formatedTimeAndDate =
        DateFormat('EE, dd MMMM yyyy - hh:mm a').format(orderTimeAndDate);
    final formatedDate =
        DateFormat('EE, dd MMMM yyyy -- hh:mm a').format(currentTimeAndDate);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      color: kalyaOrange50,
      child: ClipPath(
        clipper: OrderClipper(true, true),
        child: Container(
          decoration: BoxDecoration(
            color: shoplixWhite,
            border: Border.all(
              color: c,
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: c,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: Text(
                      'Order Receipt',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: c2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'icons/shoplix_black.png',
                  height: _imageHeight,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: OrderItems(),
              ),
              const BoldText(
                text: 'ORDER DETAILS',
                decoration: TextDecoration.underline,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ReceiptText(
                      boldText: 'BY:',
                      text: '@$_name',
                    ),
                    const ReceiptText(
                      boldText: 'ID:',
                      text: '_user.uid#',
                    ),
                    ReceiptText(
                      boldText: 'DAY:',
                      text: formatedDate,
                    ),
                    ReceiptText(
                      boldText: 'READY BY:',
                      text: formatedTimeAndDate,
                    ),
                    ReceiptText(
                      boldText: 'TIME LEFT:',
                      text: '${difference.inHours}+ Hours',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: shoplixColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 3,
              ),
              BoldText(
                text: '© The Shoplix App - ${DateTime.now().year}',
                textColor: const Color(0xFF192D30),
              ),
              const BoldText(
                text: 'GET IT TODAY',
                textColor: shoplixFavoritePink,
                decoration: TextDecoration.underline,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ReceiptText(
                      boldText: 'PLAY STORE:',
                      text: 'Shoplix App',
                      textColor: shoplixWhatsApp,
                    ),
                    ReceiptText(
                      boldText: 'WEB:',
                      textColor: shoplixBlue,
                      isLink: true,
                      text: 'https://kalyacourtshotel.web.app',
                    ),
                  ],
                ),
              ),
              const BoldText(
                text:
                    'Powered by The C APPS TEAM\n(+256 780955031)\ncapps096team@gmail.com',
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: c,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
