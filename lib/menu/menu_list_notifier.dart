import '../app_exporter.dart';
import 'menu_item.dart';

const _duration = Duration(milliseconds: 600);

class MenuListNotifier extends ChangeNotifier {
  // The currently selected category of products.
  final String _selectedCategory = 'All';
  bool _isListLoading = true;

  String get selectedCategory => _selectedCategory;

  bool get isListLoading => _isListLoading;

  /// [Search the product catalog]
  List<MenuItem> search(
      {required String searchTerm, required List<MenuItem> menuList}) {
    return menuList.where((product) {
      return product.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
          product.category.toLowerCase().contains(searchTerm.toLowerCase());
    }).toList();
  }
/* 
  ///[Load All Items]
  List<MenuItem> loadMenuItemsFromList(
      {required List<MenuItem> menuItems, required String group}) {
    if (_selectedCategory == 'All') {
      List<MenuItem> list = menuItems
          .where((MenuItem menuItem) => menuItem.group == group)
          .toList();

      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    } else if (group == 'All') {
      List<MenuItem> list = List.from(menuItems);

      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    } else {
      List<MenuItem> list = menuItems
          .where((menuItem) =>
              menuItem.category == _selectedCategory && menuItem.group == group)
          .toList();
      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    }
  }

  ///[Resets the Category]
  void resetCategory() {
    _selectedCategory = 'All';
    notifyListeners();
  }

  ///[Set the Category]
  void setCategory(String newCategory) {
    _selectedCategory = newCategory;

    notifyListeners();
  }
 */

// * This is the start of Drinks Notifiers
  ///[Drinks Notifiers and Setters]

  String _selectedDrinkCategory = 'All';

  String get selectedDrinkCategory => _selectedDrinkCategory;

  ///[Set the Drinks Category]
  void setDrinksCategory(String newCategory) {
    _selectedDrinkCategory = newCategory;

    notifyListeners();
  }

  ///`Resets the Drinks Category`
  void resetDrinksCategory() {
    _selectedDrinkCategory = 'All';
    notifyListeners();
  }

  ///[Load All Drink Items]
  List<MenuItem> loadDrinkItemsFromList({required List<MenuItem> menuItems}) {
    if (_selectedDrinkCategory == 'All') {
      List<MenuItem> drinksList = menuItems
          .where((MenuItem menuItem) => menuItem.group == 'Drink')
          .toList();

      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return drinksList;
    } else {
      List<MenuItem> drinksList = menuItems
          .where((menuItem) =>
              menuItem.category == _selectedDrinkCategory &&
              menuItem.group == 'Drink')
          .toList();
      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return drinksList;
    }
  }

  ///`Returns Foods in the Same Category`
  List<MenuItem> relatedDrinksList(
      {required List<MenuItem> menuItems, required MenuItem drink}) {
    List<MenuItem> list = menuItems
        .where((menuItem) =>
            menuItem.category == drink.category &&
            menuItem.group == 'Drink' &&
            menuItem.id != drink.id)
        .toList();
    Future.delayed(_duration, () {
      _isListLoading = false;
      notifyListeners();
    });

    return list;
  }

  ///[End Of Drinks Search]

// * This is the Start Of Food Notifiers
  ///[Food Notifiers and Setters]

  String _selectedFoodCategory = 'All';

  String get selectedFoodCategory => _selectedFoodCategory;

  ///[Set the Food Category]
  void setFoodCategory(String newCategory) {
    _selectedFoodCategory = newCategory;

    notifyListeners();
  }

  ///[Resets the Food Category]
  void resetFoodCategory() {
    _selectedFoodCategory = 'All';
    notifyListeners();
  }

  ///[Load All Food Items]
  List<MenuItem> loadFoodItemsFromList(
      {required List<MenuItem> menuItems, String? category}) {
    if (_selectedFoodCategory == 'All') {
      List<MenuItem> list = menuItems
          .where((MenuItem menuItem) => menuItem.group == 'Food')
          .toList();

      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    } else {
      List<MenuItem> list = menuItems
          .where((menuItem) =>
              menuItem.category == _selectedFoodCategory &&
              menuItem.group == 'Food')
          .toList();
      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    }
  }

  ///[Load All Food Items]
  void printFoodItemsFromList({required List<MenuItem> menuItems}) {
    // ignore: avoid_print
    menuItems.map((MenuItem item) => print(item.toString()));
  }

  ///[Returns Foods in the Same Category]
  List<MenuItem> relatedFoodList(
      {required List<MenuItem> menuItems, required MenuItem food}) {
    List<MenuItem> list = menuItems
        .where((menuItem) =>
            menuItem.category == food.category &&
            menuItem.group == 'Food' &&
            menuItem.id != food.id)
        .toList();
    Future.delayed(_duration, () {
      _isListLoading = false;
      notifyListeners();
    });

    return list;
  }

  ///[End Of Foods]
}

///[start here for local database]
// List<MenuItem> loadRelatedMenuItemsFromList(List<MenuItem> items) {
//   if (_selectedCategory == 'All') {
//     return List.from(items);
//   } else {
//     return items
//         .where(
//           (p) => p.category == _selectedCategory,
//         )
//         .toList();
//   }
// }

///[Local Database]
/*  List<MenuItem> loadMenuItemsFromList(List<MenuItem> items) {
    if (_selectedCategory == 'All') {
      List<MenuItem> list = List.from(items);
      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    } else {
      List<MenuItem> list = items
          .where(
            (p) => p.category == _selectedCategory,
          )
          .toList();
      Future.delayed(_duration, () {
        _isListLoading = false;
        notifyListeners();
      });

      return list;
    }
  }

    /// [Search the product catalog Offline]
  List<MenuItem> search(String searchTerms) {
    return menuItemx.where((product) {
      return product.name.toLowerCase().contains(searchTerms.toLowerCase());
    }).toList();
  }

 */
///[End here]
