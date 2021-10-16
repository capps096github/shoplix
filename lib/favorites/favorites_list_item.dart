import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';
import 'providers.dart';

class FavoritesListItem extends StatelessWidget {
  const FavoritesListItem({
    Key? key,
    required this.menuItem,
  }) : super(key: key);
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final isFood = menuItem.group == 'Food';
    final icon = isFood ? Icons.restaurant_menu : Icons.fastfood;
    const color = shoplixFavoritePink;
    const textColor = shoplixWhite;
    const st = TextStyle(fontSize: 24, color: textColor);

    return OpenDetail(
      menuItem: menuItem,
      child: GestureDetector(
        onLongPress: () => context
            .read(favoritesProvider)
            .removeItemFromfavorites(menuItem.id),
        child: Container(
          margin: EdgeInsets.zero,
          color: shoplixWhite,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: menuItem.imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return Center(
                    child: Icon(
                      icon,
                      color: color,
                      size: 50,
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color.withOpacity(0.9)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          menuItem.name,
                          textAlign: TextAlign.center,
                          style: st.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Divider(
                          color: shoplixWhite,
                          endIndent: 10,
                          indent: 10,
                          height: 6,
                        ),
                        Text(
                          formatter.format(menuItem.price),
                          style: st.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                icon,
                                color: shoplixWhite,
                                size: 15,
                              ),
                            ),
                            Text(
                              ' •	${menuItem.category}',
                              style: st.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: shoplixFavoritePink,
                    child: Icon(
                      Icons.favorite,
                      color: shoplixWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
