import 'package:flutter/material.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  const ResponsiveApp({
    Key? key,
    required this.desktop,
    this.tablet,
    required this.mobile,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 650 &&
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024 &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final isPotrait = orientation == Orientation.portrait;
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth <= 650 && isPotrait) {
          return mobile;
        } else if (constraints.maxWidth < 1024 &&
            tablet != null &&
            isLandscape) {
          return tablet!;
        } else {
          return desktop;
        }
      },
    );
  }
}
