import 'package:flutter/foundation.dart';

import '../app_exporter.dart';
import '../shared/shoplix_logo.dart';

const bagBox = 'bag_items';
const favoritesBox = 'favorites';
const recentsBox = 'recent_search';

class HiveConnector extends StatefulWidget {
  const HiveConnector({Key? key}) : super(key: key);

  @override
  _HiveConnectorState createState() => _HiveConnectorState();
}

class _HiveConnectorState extends State<HiveConnector> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final bagHiveConnect = watch(bagHive);

        return AnimatedSwitcher(
          duration: defaultDuration,
          child: bagHiveConnect.when(
              data: (_) {
                //! Do Any Cloud Uploads here
                // no ads for web
                return const Shoplix();
              },
              loading: () => const ShoplixLogo(),
              error: (error, stackTrace) => ErrorWidget(error)),
        );
      },
    );
  }

  @override
  void dispose() {
    Hive.box(bagBox).compact();
    Hive.box(favoritesBox).compact();
    Hive.box(recentsBox).compact();
    Hive.close();
    super.dispose();
  }
}

final bagHive = FutureProvider<Box<BagItem>>((ref) async {
  ///[Get Favorites]
  await Hive.openBox<MenuItem>(favoritesBox,
      compactionStrategy: (entries, deletedEntries) => deletedEntries > 10);

  ///[Get Recent Searches]
  await Hive.openBox<SearchItem>(recentsBox,
      compactionStrategy: (entries, deletedEntries) => deletedEntries > 10);

  ///[Get BagItems]
  return Hive.openBox<BagItem>(bagBox,
      compactionStrategy: (entries, deletedEntries) => deletedEntries > 10);
});
