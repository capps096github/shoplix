import '../../app_exporter.dart';
import '../filter_icon.dart';
import '../providers.dart';

class FoodChips extends StatefulWidget {
  const FoodChips({Key? key}) : super(key: key);

  @override
  _FoodChipsState createState() => _FoodChipsState();
}

class _FoodChipsState extends State<FoodChips> with RestorationMixin {
  final RestorableIntN _indexSelected = RestorableIntN(null);

  @override
  String get restorationId => 'food_chips_key';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'food_chip');
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FilterIcon(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: foodCategories.length,
              itemBuilder: (context, index) {
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 1000),
                  padding:
                      EdgeInsets.all(_indexSelected.value == index ? 4 : 2),
                  key: Key(foodCategories[index]),
                  child: FilterChip(
                    pressElevation: 10,
                    label: Text(foodCategories[index]),
                    backgroundColor: shoplixWhite,
                    avatar: _indexSelected.value == index
                        ? const CircleAvatar(
                            backgroundColor: shoplixWhite,
                            child: Icon(
                              Ionicons.pizza,
                              size: 14,
                              color: shoplixColor,
                            ),
                          )
                        : null,
                    showCheckmark: false,
                    selectedColor: shoplixColor,
                    tooltip: '${foodCategories[index]} Category',
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
                              .setFoodCategory(foodCategories[index])
                          : context.read(menuListNotifier).resetFoodCategory();
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
