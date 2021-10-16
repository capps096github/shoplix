import '../../app_exporter.dart';
import 'search_item.dart';

class RecentSearches extends ChangeNotifier {
  final recentSearchesBox = Hive.box<SearchItem>('recent_search');

  ///[Length od Box Items]
  int get boxLength => recentSearchesBox.length;

  ///[Checks wether Item is in Favorite list]
  bool isFavorite(int id) => recentSearchesBox.containsKey(id);

  SearchItem recentSearchItem(int index) =>
      recentSearchesBox.getAt(index) as SearchItem;

  ///[Adds item to cart and the database too]
  void addItemTorecentSearches(SearchItem searchItem) {
    recentSearchesBox.put(searchItem.id, searchItem);

    notifyListeners();
  }

  ///[Remove item to cart and the database too]
  void removeItemFromrecentSearches(int id) {
    recentSearchesBox.delete(id);
    notifyListeners();
  }

  ///[Clear the cart]
  void clearrecentSearches() {
    recentSearchesBox.deleteAll(recentSearchesBox.keys);
    notifyListeners();
  }
}


///provides a string [RecentSearches]
final recentSearchesProvider =
    ChangeNotifierProvider<RecentSearches>((_) => RecentSearches());
