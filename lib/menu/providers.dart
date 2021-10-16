import '../app_exporter.dart';
import 'menu_list_notifier.dart';

///This provides the current value of the
///[selected menu tab (food or drink menu)]
final currentMenuIndexProvider = StateProvider((ref) => 0);

///[MenuListNotifier] provider
final menuListNotifier =
    ChangeNotifierProvider<MenuListNotifier>((_) => MenuListNotifier());


///This provides the current value of the
///[Wether this is menu or not]
final isMenuScreenProvider = StateProvider((ref) => false);
