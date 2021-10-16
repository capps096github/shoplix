import '../app_exporter.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key? key,
    required this.child,
    this.bacColor = Colors.white,
  }) : super(key: key);
  final Widget child;
  final Color bacColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: child,
        backgroundColor: bacColor,
      ),
    );
  }
}
