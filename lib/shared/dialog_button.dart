import '../app_exporter.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {Key? key,
      required this.textColor,
      required this.buttonColor,
      required this.icon,
      required this.text,
      required this.onTap})
      : super(key: key);
  final Color textColor;
  final Color buttonColor;
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 6),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      icon: Icon(
        icon,
        color: textColor,
        // color: cola2,
      ),
      label: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: cola2,
              color: textColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      onPressed: onTap,
    );
  }
}
