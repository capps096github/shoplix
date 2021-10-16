import '../app_exporter.dart';

class LoadingMenuItem extends StatelessWidget {
  const LoadingMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kalyaOrange100.withOpacity(0.5),
      ),
    );
  }
}
