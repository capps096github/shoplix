import '../../app_exporter.dart';

class ReceiptText extends StatelessWidget {
  const ReceiptText({
    Key? key,
    required this.text,
    required this.boldText,
    this.textColor = shoplixColor,
    this.isLink = false,
  }) : super(key: key);

  final String text, boldText;
  final Color textColor;
  final bool isLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          boldText,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              decoration:
                  isLink ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
