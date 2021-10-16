import 'package:flutter/scheduler.dart';

import '../app_exporter.dart';
import 'providers.dart';
import 'related_items_cloud_screen.dart';

const st = TextStyle(
  fontSize: 24,
  color: shoplixColor,
  fontWeight: FontWeight.w900,
);

class DetailScreen extends ConsumerWidget {
  final MenuItem menuItemx;
  const DetailScreen({
    required this.menuItemx,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isRelatedItemScreen = watch(isRelatedItemsProvider).state;

    final menuItem = watch(detailItemProvider).state ?? menuItemx;
    // timeDilation = 4;

    ///[Change this to a set of items]
    ///[ that excludes the currently selected item]
    return Scaffold(
      extendBodyBehindAppBar: isRelatedItemScreen ? false : true,
      backgroundColor: shoplixOrange,
      appBar: buildAppBar(
        isRelatedItemScreen: isRelatedItemScreen,
        title: '${menuItem.group}s',
        back: () {
          Navigator.of(context).pop();
          context.read(detailItemProvider).state = null;
        },
        onTap: () =>
            context.read(isRelatedItemsProvider).state = !isRelatedItemScreen,
      ),
      bottomNavigationBar: isRelatedItemScreen
          ? const SizedBox()
          : BottomNavBar(menuItem: menuItem),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 3),
        reverse: !isRelatedItemScreen,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: shoplixOrange,
          // key: isRelatedItemScreen ? ValueKey('Related') : ValueKey('Detail'),
          transitionType: SharedAxisTransitionType.horizontal,

          child: child,
        ),
        child: isRelatedItemScreen
            ? RelatedItemsCloudScreen(menuItem: menuItem)
            : ItemDetails(menuItem: menuItem),
      ),
    );
  }

  AppBar buildAppBar(
      {required bool isRelatedItemScreen,
      required String title,
      required VoidCallback onTap,
      required VoidCallback back}) {
    return isRelatedItemScreen
        ? AppBar(
            title: Text('Related $title'),
            leading: CloseButton(
              onPressed: onTap,
            ),
          )
        : AppBar(
            backgroundColor: Colors.transparent,
            leading: AppBarIcon(
              child: BackButton(color: shoplixWhite, onPressed: back),
              bacColor: shoplixColor,
            ),
            // actions: [
            //   AppBarIcon(
            //     child: IconButton(
            //       onPressed: () {
            //         print(' Share this item');
            //       },
            //       icon: const Icon(
            //         Icons.share_outlined,
            //         color: kalyaBrown900,
            //       ),
            //     ),
            //   ),
            // ],
          );
  }
}
