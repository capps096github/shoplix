
import '../detail/exporter.dart';

import '../menu/menu_item.dart';

import '../app_exporter.dart';

class OpenDetail extends StatelessWidget {
  const OpenDetail(
      {Key? key,
      required this.menuItem,
      required this.child,
      this.openColor = Colors.transparent,
      this.closedColor = Colors.transparent,
      })
      : super(key: key);
  final MenuItem menuItem;
  final Widget child;
  final Color openColor, closedColor;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, _) => DetailScreen(menuItemx: menuItem),
      openColor: openColor,
      //*closed
      closedColor: closedColor,
      clipBehavior: Clip.antiAlias,
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      closedBuilder: (context, openDetail) {
        return Material(
          color: closedColor,
          child: InkWell(
            onTap: openDetail,
            child: child,
          ),
        );
      },
    );
  }
}
