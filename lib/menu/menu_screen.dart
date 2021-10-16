import '../app_exporter.dart';
import 'drinks/drink_chips.dart';
import 'drinks/drink_cloud_body.dart';
import 'food/food_chips.dart';
import 'food/food_cloud_body.dart';
import 'menu_screen_fab.dart';
import 'providers.dart';
import 'search/search-delegate/kalya_search.dart';
import 'search/search_container.dart';
import 'segmented_control.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MenuScreenWidget();
  }
}

class MenuScreenWidget extends StatelessWidget {
  const MenuScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kalyaOrange50,
      appBar: AppBar(
        backgroundColor: shoplixOrange,
        title: const PageTitle(
          title: 'Shoplix',
          color: shoplixColor,
        ),
        
      ),
      floatingActionButton: const MenuScreenFAB(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: shoplixOrange,
            floating: true,
            title: InkWell(
              child: const SearchContainer(),
              onTap: () => showSearch(
                context: context,
                delegate: KalyaSearch(
                  hintText: 'Search a Food or Drink',
                ),
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: shoplixOrange,
            elevation: 8,
            shadowColor: shoplixColor,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: MenuControl(),
                  ),
                  Consumer(
                    builder: (context, watch, child) {
                      final currentValue =
                          watch(currentMenuIndexProvider).state;
                      final isFoodMenu = currentValue == 0;
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child:
                            isFoodMenu ? const FoodChips() : const DrinkChips(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, watch, child) {
            final currentValue = watch(currentMenuIndexProvider).state;
            final isFoodMenu = currentValue == 0;

            return isFoodMenu ? const FoodCloudBody() : const DrinkCloudBody();
          }),
        ],
      ),
    );
  }
}
