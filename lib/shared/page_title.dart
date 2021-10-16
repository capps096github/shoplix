import '../app_exporter.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    this.color = kalyaBrown900,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
        top: 8.0,
      ),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.playfairDisplay(
          color: color,
          fontSize: 25,
          wordSpacing: 3,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
