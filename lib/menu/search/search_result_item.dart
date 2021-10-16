import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';
import '../menu_item.dart';

class SearchResultItem extends ConsumerWidget {
  const SearchResultItem({
    Key? key,
    required this.menuItem,
    required this.searchQuery,
  }) : super(key: key);
  final MenuItem menuItem;
  final String searchQuery;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final localTheme = Theme.of(context);
    // timeDilation = 2;

    return OpenDetail(
      menuItem: menuItem,
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 4),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: kalyaOrange50,
                      child: CachedNetworkImage(
                        imageUrl: menuItem.imageUrl,
                        fit: BoxFit.cover,
                        width: 75,
                        height: 75,
                        placeholder: (context, url) {
                          final isFood = menuItem.group == 'Food';
                          final icon = isFood
                              ? Ionicons.pizza
                              : Ionicons.fast_food;
                          return Center(
                            child: Icon(
                              icon,
                              color: shoplixColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: MergeSemantics(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SubstringHighlight(
                            text: menuItem.name,
                            term: searchQuery,
                            textStyle: localTheme.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textStyleHighlight:
                                localTheme.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              backgroundColor: shoplixOrange,
                              color: shoplixColor,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(height: 16),
                          MergeSemantics(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    formatter.format(menuItem.price),
                                    style: localTheme.textTheme.bodyText1
                                        ?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Consumer(
                                  builder: (context, watch, child) {
                                    final isFood = menuItem.group == 'Food';
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Tooltip(
                                        message: isFood
                                            ? 'From the Food Menu'
                                            : 'From the Drinks Menu',
                                        child: Icon(
                                          isFood
                                              ? Ionicons.pizza
                                              : Ionicons.fast_food_outline,
                                          color: shoplixWhite,
                                          size: 16,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SubstringHighlight(
                            text: menuItem.category + ' •	Category',
                            term: searchQuery,
                            textStyle: localTheme.textTheme.bodyText1!.copyWith(
                              color: shoplixWhite,
                              fontSize: 10,
                            ),
                            textStyleHighlight:
                                localTheme.textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              backgroundColor: shoplixOrange,
                              color: shoplixColor,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(
                color: shoplixWhite,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
