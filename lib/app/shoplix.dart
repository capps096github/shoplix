import 'package:firebase_analytics/observer.dart';

import '../app_exporter.dart';
import 'routes.dart';

FirebaseAnalytics _analytics = FirebaseAnalytics();

class Shoplix extends StatelessWidget {
  const Shoplix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoplix | Online Shopping',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: _analytics),
      ],
      restorationScopeId: "shoplix",
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
      theme: ThemeData(
        primaryColor: shoplixColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: shoplixColor,
          elevation: 0,
        ),
        tooltipTheme: TooltipThemeData(
          textStyle: const TextStyle(color: shoplixColor),
          decoration: BoxDecoration(
            color: shoplixWhite,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      routes: shoplixRoutes,
      initialRoute: '/',
    );
  }
}
