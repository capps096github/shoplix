import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../app_exporter.dart';
import 'bag_banner.dart';
import 'bag_bottom_navbar.dart';
import 'bag_header.dart';
import 'bag_item_tile.dart';
import 'providers.dart';

class BagHiveScreen extends ConsumerWidget {
  const BagHiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bagHive = watch(bagHiveProvider);

    timeDilation = 3;
    return Scaffold(
      backgroundColor: shoplixColor,
      appBar: AppBar(
        backgroundColor: shoplixOrange,
        leading: const BackButton(
          color: shoplixColor,
        ),
        title: const PageTitle(title: 'BAG'),
        bottom: bagHive.bagBox.isNotEmpty
            ? const PreferredSize(
                preferredSize: Size.fromHeight(56.0),
                child: BagHeader(),
              )
            : null,
      ),
      bottomNavigationBar: const BagBottomNavBar(),
      body: bagHive.bagBox.isNotEmpty ? const BagHiveList() : const NoItems(),
    );
  }
}

class BagHiveList extends ConsumerWidget {
  const BagHiveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final animatedListKey = GlobalKey<AnimatedListState>();
    final bagHive = watch(bagHiveProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      child: Column(
        children: [
          const BagBanner(),
          Expanded(
            child: AnimatedList(
              key: animatedListKey,
              itemBuilder: (context, index, animation) {
                final bagItem = bagHive.bagItem(index);
                return ScaleTransition(
                  scale: animation,
                  child: BagItemTile(
                    bagItem: bagItem,
                    onTap: () {
                      bagHive.removeItemFromBag(bagItem.id);
                      // print('''Delete this item on Long press
                      //     and always show a toast to the user whenever they
                      //     navigate to this screen that long ress any item to delete it''');

                      animatedListKey.currentState?.removeItem(
                        index,
                        (context, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: Container(color: Colors.redAccent[700]),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              physics: const BouncingScrollPhysics(),
              initialItemCount: bagHive.boxLength,
            ),
          ),
        ],
      ),
    );
  }
}

class NoItems extends StatelessWidget {
  const NoItems({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Center(child: EmptyBag()),
        Center(
          child: Text(
            'Add\n "Foods and Drinks to your Bag"\n Here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: shoplixOrange,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyBag extends StatefulWidget {
  const EmptyBag({Key? key}) : super(key: key);
  @override
  _EmptyBagState createState() => _EmptyBagState();
}

class _EmptyBagState extends State<EmptyBag> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('lottie/empty_bag.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(
            composition: composition,
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(color: shoplixOrange));
        }
      },
    );
  }
}
