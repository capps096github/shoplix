import '../../app_exporter.dart';

Future showGoodToast({
  required BuildContext context,
  required String goodText,
  Color? backgroundColor,
  Color? textColor,
}) async {
  return showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (context, controller) {
      return Flash.bar(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            goodText.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? kalyaWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        barrierDismissible: false,
        reverseAnimationCurve: Curves.bounceOut,
        insetAnimationCurve: Curves.easeIn,
        position: FlashPosition.top,
        borderRadius: BorderRadius.circular(8),
        backgroundColor: backgroundColor ?? kalyaBlue,
        margin: const EdgeInsets.all(30),
      );
    },
  );
}
