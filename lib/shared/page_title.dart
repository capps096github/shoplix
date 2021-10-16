import '../app_exporter.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    this.color = shoplixColor,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "icons/shoplix_black.png",
            height: 30,
            width: 30,
          ),
          const HorizintalSpacing(of: 10),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.dancingScript(
              color: color,
              fontSize: 25,
              wordSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
