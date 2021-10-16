import 'package:intl/intl.dart';

import '../app_exporter.dart';
import 'navbar/order_navbar.dart';
import 'widgets/bold_text.dart';
import 'widgets/receipt_text.dart';

// User _user = FirebaseAuth.instance.currentUser!;
const _name = "_user.displayName?.split(' ').first";

class FewClicksToOrder extends ConsumerWidget {
  const FewClicksToOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final isAnimationDone = watch(isAnimationDoneProvider).state;
    final height = MediaQuery.of(context).size.height * 0.4;
    final isTimeDate1Set = watch(isTimeDate1SetProvider).state;
    final orderTimeAndDate = watch(orderTimeAndDateProvider);

    final formatedTimeAndDate =
        DateFormat('EE, dd MMMM yyyy - hh:mm a').format(orderTimeAndDate);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EntranceFader(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  onFinished: () =>
                      context.read(isAnimationDoneProvider).state = true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Hello $_name\n\n You are a few clicks away to ordering your next meal with us at\nShoplix.',
                      textAlign: TextAlign.center,
                      cursor: '|',
                      curve: Curves.easeIn,
                      speed: const Duration(milliseconds: 10),
                      textStyle: const TextStyle(
                        color: shoplixColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isAnimationDone)
            Expanded(
              child: EntranceFader(
                child: AnimatedContainer(
                    height: height,
                    duration: const Duration(milliseconds: 500),
                    child: const Icon(
                      Ionicons.fast_food_outline,
                      color: shoplixColor,
                    )),
              ),
            ),
          if (isAnimationDone)
            EntranceFader(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: shoplixColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      height: 4,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kalyaOrange50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    if (!isTimeDate1Set)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Select the Date and Time\n'
                          'You expect to have your Products at'
                          '\nShoplix\n and we will\nprepare and get it ready\nfor you.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kalyaOrange50,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    if (isTimeDate1Set)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BoldText(
                          text: 'SELECTED DATE & TIME',
                          decoration: TextDecoration.underline,
                          textColor: shoplixOrange,
                        ),
                      ),
                    if (isTimeDate1Set)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReceiptText(
                          boldText: 'DATE & TIME:',
                          text: formatedTimeAndDate,
                          textColor: shoplixOrange,
                        ),
                      ),
                    const OrderNavBar(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
