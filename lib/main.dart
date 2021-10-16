
import 'app_exporter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BagItemAdapter());
  Hive.registerAdapter(MenuItemAdapter());
  Hive.registerAdapter(SearchItemAdapter());

  runApp(
    const ProviderScope(
      child:  RootRestorationScope(
        restorationId: 'shoplix',
        child:  FirebaseConnector(),
      ),
    ),
  );
}
