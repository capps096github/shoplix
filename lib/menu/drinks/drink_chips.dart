import '../../app_exporter.dart';
import '../filter_icon.dart';
import '../providers.dart';

//use this to update the ui globally
final categoryProvider = StateProvider((ref) => '');

class DrinkChips extends StatefulWidget {
  const DrinkChips({Key? key}) : super(key: key);

  @override
  _DrinkChipsState createState() => _DrinkChipsState();
}

class _DrinkChipsState extends State<DrinkChips> with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);

  @override
  String get restorationId => 'drink_chips_key';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'drink_chip');
  }

  @override
  void dispose() {
    _indexSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Row(
        children: [
          const FilterIcon(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: drinkCategories.length,
              itemBuilder: (context, index) {
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 1000),
                  padding:
                      EdgeInsets.all(_indexSelected.value == index ? 4 : 2),
                  key: Key(drinkCategories[index]),
                  child: FilterChip(
                    pressElevation: 10,
                    label: Text(drinkCategories[index]),
                    backgroundColor: shoplixWhite,
                    avatar: _indexSelected.value == index
                        ? const CircleAvatar(
                            backgroundColor: shoplixWhite,
                            child: Icon(
                              Icons.fastfood,
                              size: 14,
                              color: shoplixColor,
                            ),
                          )
                        : null,
                    showCheckmark: false,
                    selectedColor: shoplixColor,
                    labelStyle: TextStyle(
                      color: _indexSelected.value == index
                          ? shoplixWhite
                          : shoplixColor,
                    ),
                    selected: _indexSelected.value == index,
                    onSelected: (value) {
                      setState(() {
                        _indexSelected.value = value ? index : 0;
                      });
                      _indexSelected.value == index
                          ? context
                              .read(menuListNotifier)
                              .setDrinksCategory(drinkCategories[index])
                          : context
                              .read(menuListNotifier)
                              .resetDrinksCategory();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
