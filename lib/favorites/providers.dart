
import '../app_exporter.dart';
import 'favorites.dart';

///provides a string [Favorites]
final favoritesProvider = ChangeNotifierProvider<Favorites>((_) => Favorites());


///This provides the current value of the
///[selected menu tab (food or drink menu)]
final isFavoriteScreenProvider = StateProvider((ref) => false);


final showFavBannerProvider = StateProvider((ref) => true);
