import '../app_exporter.dart';

class ItemNamePrice extends StatelessWidget {
  const ItemNamePrice({
    Key? key,
    required this.menuItem,
  }) : super(key: key);
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        menuItem.name.toUpperCase(),
        style:TextStyles.h2.copyWith(color: shoplixColor),
      ),
      subtitle: Text(
        menuItem.category + ' • Category',
        style: TextStyles.h2.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          // fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Text(
        formatter.format(menuItem.price),
        style:TextStyles.h2.copyWith(color: shoplixColor),
      ),
    );
  }
}
