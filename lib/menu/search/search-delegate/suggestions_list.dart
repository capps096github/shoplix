import '../../../app_exporter.dart';
import '../../menu_item.dart';
import '../../providers.dart';
import '../search_result_item.dart';

class SuggestionsList extends StatelessWidget {
  const SuggestionsList({Key? key, required this.query}) : super(key: key);

  final String query;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: shoplixColor,
      padding: const EdgeInsets.only(top: 16),
      key: const Key('list'),
      child: Consumer(builder: (context, watch, child) {
        final database = watch(cloudDatabaseNotifier);

        final databaseProvider = watch(database.menuListProviderx);

        final menuListProvider = watch(menuListNotifier);
        // final menuListProvider = watch(menuListNotifier);

        return databaseProvider.when(
            data: (List<MenuItem> menuList) {
              final results = menuListProvider.search(
                  searchTerm: query, menuList: menuList);

              return results.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => SearchResultItem(
                        menuItem: results[index],
                        searchQuery: query,
                      ),
                      itemCount: results.length,
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Opps! We dont have "$query" on our '
                          'menu,Give us feedback wether we should add it',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: shoplixWhite),
                        ),
                      ),
                    );
            },
            loading: () => const Center(
                child: CircularProgressIndicator(color: shoplixColor)),
            error: (error, stackTrace) {
              return ErrorWidget(error);
            });
      }),
    );
  }
}
