import 'app_exporter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BagItemAdapter());
  Hive.registerAdapter(MenuItemAdapter());
  Hive.registerAdapter(SearchItemAdapter());

  // This removes the # from our web
  setPathUrlStrategy();

  runApp(
    const ProviderScope(
      child: RootRestorationScope(
        restorationId: 'shoplix',
        child: FirebaseConnector(),
      ),
    ),
  );
}
