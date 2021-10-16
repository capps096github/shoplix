import '../../app_exporter.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    Key? key,
    required this.text,
    this.decoration = TextDecoration.none,
    this.textColor = kalyaBrown900,
  }) : super(key: key);

  final String text;
  final TextDecoration decoration;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w900,
          decoration: decoration,
        ),
      ),
    );
  }
}
