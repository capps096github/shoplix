import '../app_exporter.dart';

class BagItemsBadge extends ConsumerWidget {
  final Widget child;

  const BagItemsBadge({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bagHive = watch(bagHiveProvider);
    final numOfItems = bagHive.totalBagQuantity;
    return Badge(
      // alignment: Alignment.topRight,
      toAnimate: false,
      position: BadgePosition.topEnd(),
      badgeColor: kalyaRed,
      showBadge: numOfItems == 0 ? false : true,
      badgeContent: Text(
        numOfItems >= 100 ? '99+' : '$numOfItems',
        style: TextStyles.caption,
      ),
      child: child,
    );
  }
}
