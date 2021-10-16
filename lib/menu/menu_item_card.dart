import 'package:cached_network_image/cached_network_image.dart';

import '../app_exporter.dart';
import 'menu_item.dart';

class MenuItemCard extends ConsumerWidget {
  const MenuItemCard({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // timeDilation = 2;
    final isFood = menuItem.group == 'Food';
    final icon = isFood ? Ionicons.pizza : Ionicons.fast_food;
    const color = shoplixOrange;
    const textColor = shoplixColor;
    const st = TextStyle(fontSize: 24, color: textColor);

    return OpenDetail(
      menuItem: menuItem,
      closedColor: color,
      child: Container(
        margin: EdgeInsets.zero,
        color: Colors.transparent,
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
                    color: textColor,
                    size: 50,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color.withOpacity(0.8)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      paddedText(
                        text: menuItem.name,
                        style: st.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Divider(
                        color: textColor,
                        endIndent: 10,
                        indent: 10,
                        height: 6,
                      ),
                      paddedText(
                        text: formatter.format(menuItem.price),
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
                              color: textColor,
                              size: 15,
                            ),
                          ),
                          paddedText(
                            text: ' • ${menuItem.category}',
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
          ],
        ),
      ),
    );
  }
}

Widget paddedText({required String text, required TextStyle style}) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Text(
      text,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: style,
    ),
  );
}
