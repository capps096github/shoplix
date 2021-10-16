import '../app_exporter.dart';
import 'bag_hive.dart';

///provides a string ['Food' or 'Drink']
final bagHiveProvider = ChangeNotifierProvider<BagHive>((_) => BagHive());


final showBannerProvider = StateProvider((ref) => true);
