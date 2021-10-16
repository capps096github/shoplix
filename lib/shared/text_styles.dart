import '../app_exporter.dart';

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class FontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s24 => 24 * scale;
  static double get s48 => 48 * scale;
}

class TextStyles {
  /// Declare a base style for each Family
  static TextStyle nunito = TextStyle(
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontWeight: FontWeight.w400,
      height: 1);
  static TextStyle fraunces = TextStyle(
      fontFamily: GoogleFonts.lato().fontFamily,
      fontWeight: FontWeight.w400,
      height: 1);

  static TextStyle get h1 => fraunces.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.s48,
      letterSpacing: -1,
      height: 1.17);
  static TextStyle get h2 => h1.copyWith(
        fontSize: FontSizes.s24,
        letterSpacing: -.5,
        height: 1.16,
      );
  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);
  static TextStyle get title1 => nunito.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s16,
        height: 1.31,
        shadows: [
          const Shadow(
            color: shoplixColor,
            offset: Offset(1, 1),
          ),
        ],
      );
  static TextStyle get description => nunito.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s24,
        height: 1.31,
      );
  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s14, height: 1.36);
  static TextStyle get body1 => nunito.copyWith(
      fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);
  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);
  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);
  static TextStyle get callout1 => nunito.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s12,
      color: shoplixColor,
      height: 1.17,
      letterSpacing: .5);
  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);
  static TextStyle get caption => nunito.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: FontSizes.s11,
        height: 1.36,
        color: shoplixWhite,
      );
}
