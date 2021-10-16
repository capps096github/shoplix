import '../app_exporter.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.tune,
        color: shoplixColor,
        semanticLabel: 'filter',
      ),
    );
  }
}
