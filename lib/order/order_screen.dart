import 'package:flutter/cupertino.dart';

import '../app_exporter.dart';
import 'navbar/order_navbar.dart';
import 'few_clicks_to_order.dart';
import 'receipt.dart';

const double _imageHeight = 54;

class OrderScreen extends ConsumerWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    const c = kalyaBrown900;
    const c2 = kalyaOrange50;
    // final isConfirmed = watch(isOrderConfirmedProvider).state;
    final isTimeDateSet = watch(isTimeDateSetProvider).state;
    // final isAnimationDone = watch(isAnimationDoneProvider).state;
    // bool isConfirmed = watch(isOrderConfirmedProvider).state;

    return Scaffold(
      backgroundColor: kalyaOrange50,
      bottomNavigationBar: isTimeDateSet
          ? const EntranceFader(child: OrderNavBar())
          : const SizedBox(),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 3),
        reverse: !isTimeDateSet,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: kalyaOrange50,
          key:
              isTimeDateSet ? const ValueKey('Set') : const ValueKey('Confirm'),
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: _imageHeight,
              backgroundColor: kalyaOrange50,
              iconTheme: Theme.of(context).iconTheme,
              centerTitle: true,
              leading: CloseButton(
                color: kalyaBrown900,
                onPressed: () {
                  ///Reset all Providers
                  context.read(orderDateProvider).state = DateTime.now();
                  context.read(orderTimeProvider).state = TimeOfDay.now();

                  ///Bool Providers
                  context.read(isOrderSavedToGalleryProvider).state = false;
                  context.read(isAnimationDoneProvider).state = false;
                  context.read(isTimeDateSetProvider).state = false;
                  context.read(isTimeDate1SetProvider).state = false;
                  context.read(isOrderConfirmedProvider).state = false;

                  Navigator.of(context).pop();
                },
              ),
              title: Image.asset(
                'images/kalya-logo.png',
                height: _imageHeight,
              ),
              pinned: true,
            ),
            // if (isConfirmed)
            //   SliverAppBar(
            //     backgroundColor: kalyaOrange50,
            //     iconTheme: Theme.of(context).iconTheme,
            //     centerTitle: true,
            //     automaticallyImplyLeading: false,
            //     pinned: true,
            //     title: const SaveToGallery(),
            //   ),
            !isTimeDateSet
                ? const SliverFillRemaining(child: FewClicksToOrder())
                : SliverList(
                    delegate: SliverChildListDelegate(
                      const [
                        EntranceFader(child: Receipt(c: c, c2: c2)),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
