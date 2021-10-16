import '../app_exporter.dart';

class Favorites extends ChangeNotifier {
  final favoritesBox = Hive.box<MenuItem>('favorites');

  ///[Length od Box Items]
  int get boxLength => favoritesBox.length;

  ///[Checks wether Item is in Favorite list]
  bool isFavorite(int id) => favoritesBox.containsKey(id);

  MenuItem favoritesItem(int index) => favoritesBox.getAt(index) as MenuItem;

  ///[Adds item to cart and the database too]
  void addItemTofavorites(MenuItem menuItem) {
    if (favoritesBox.containsKey(menuItem.id)) {
      removeItemFromfavorites(menuItem.id);
    } else {
      favoritesBox.put(menuItem.id, menuItem);
    }

    notifyListeners();
  }

  ///[Remove item to cart and the database too]
  void removeItemFromfavorites(int id) {
    favoritesBox.delete(id);
    notifyListeners();
  }

  ///[Clear the cart]
  void clearFavorites() {
    favoritesBox.deleteAll(favoritesBox.keys);
    notifyListeners();
  }
}
