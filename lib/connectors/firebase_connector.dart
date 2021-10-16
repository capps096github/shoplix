import 'hive_connector.dart';

import '../shared/shoplix_logo.dart';

import '../app_exporter.dart';

class FirebaseConnector extends ConsumerWidget {
  const FirebaseConnector({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final firebaseConnector = watch(firebaseProvider);

    return firebaseConnector.when(
      data: (_) => const HiveConnector(),
      loading: () => Container(
        color: shoplixWhite,
        child: const ShoplixLogo(),
      ),
      error: (error, stackTrace) => ErrorWidget(error),
    );
  }
}

final firebaseProvider = FutureProvider<FirebaseApp>((ref) async {
  return Firebase.initializeApp();
});
