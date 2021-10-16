import '../../app_exporter.dart';
import 'providers.dart';

class BagBottomNavBar extends ConsumerWidget {
  const BagBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bagHive = watch(bagHiveProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: bagHive.bagBox.isNotEmpty
          ? SizedBox(
              height: kToolbarHeight + 15,
              // color: kalyaBrown900,
              child: PaddedRow(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: OpenContainer(
                      openBuilder: (context, _) => const OrderScreen(),
                      openColor: kalyaOrange50,
                      closedColor: Colors.transparent,
                      closedElevation: 0,
                      closedBuilder: (context, openContainer) => TextButton(
                        onPressed: openContainer,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              color: kalyaBrown900,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: kalyaOrange100,
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ExpandedScrollingColumn(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Grand Total',
                            style: TextStyle(
                              color: kalyaOrange50,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            formatter.format(bagHive.totalCost),
                            style: const TextStyle(
                              color: kalyaOrange50,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
