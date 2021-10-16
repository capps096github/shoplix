import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';
import 'bag_item.dart';
import 'providers.dart';

const _sty = TextStyle(color: kalyaOrange50);
const _startColumnWidth = 60.0;

class BagItemTile extends ConsumerWidget {
  const BagItemTile({
    Key? key,
    required this.bagItem,
    required this.onTap,
  }) : super(key: key);
  final BagItem bagItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final localTheme = Theme.of(context);
    final bagHive = watch(bagHiveProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            container: true,
            label: bagItem.name,
            button: true,
            enabled: true,
            child: ExcludeSemantics(
              child: SizedBox(
                width: _startColumnWidth,
                child: Tooltip(
                  message: bagItem.qty != 1
                      ? 'Reduce the Quantity of ${bagItem.name} Items'
                      : 'Remove from your Bag',
                  child: IconButton(
                    onPressed: bagItem.qty == 1
                        ? () => bagHive.removeItemFromBag(bagItem.id)
                        : () {
                            bagHive.decrementItemQuantity(bagItem);
                          },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: kalyaOrange50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: InkWell(
                splashColor: kalyaOrange50,
                onLongPress: onTap,
                onTap: () => bagHive.incrementItemQuantity(bagItem),
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
                            child: KalyaImage(
                              imageUrl: bagItem.imageUrl,
                              fit: BoxFit.cover,
                              width: 75,
                              height: 75,
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
                                Text(
                                  quantityFormatter.format(bagItem.qty),
                                  style: _sty,
                                ),
                                Text(
                                  bagItem.name,
                                  style:
                                      localTheme.textTheme.subtitle1?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kalyaOrange50,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                MergeSemantics(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          formatter.format(
                                              bagItem.price * bagItem.qty),
                                          style: localTheme.textTheme.bodyText1
                                              ?.copyWith(
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                      Consumer(
                                        builder: (context, watch, child) {
                                          final isFood =
                                              bagItem.group == 'Food';
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Tooltip(
                                              message: isFood
                                                  ? 'From the Food Menu'
                                                  : 'From the Drinks Menu',
                                              child: Icon(
                                                isFood
                                                    ? Ionicons.pizza
                                                    : Ionicons
                                                        .fast_food_outline,
                                                color: kalyaOrange50,
                                                size: 16,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  bagItem.category + ' •	Category',
                                  textAlign: TextAlign.center,
                                  style:
                                      localTheme.textTheme.bodyText1?.copyWith(
                                    color: kalyaOrange50,
                                    fontSize: 10,
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
                      color: kalyaOrange50,
                      height: 5,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
