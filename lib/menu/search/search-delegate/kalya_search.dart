import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'recents_list.dart';
import 'suggestions_list.dart';

import '../../../app_exporter.dart';

class KalyaSearch extends SearchDelegate<String> {
  KalyaSearch({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          // searchFieldDecorationTheme:
        );

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    final color2 = query.isEmpty ? shoplixOrange : shoplixWhite;
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        height: 54,
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        decoration: BoxDecoration(
          color: color2,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Image.asset(
          'icons/shoplix_black.png',
          height: 50,
        ),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final color = query.isEmpty ? shoplixColor : shoplixOrange;
    final color2 = query.isEmpty ? shoplixOrange : shoplixColor;
    return ThemeData(
      primaryColor: shoplixColor,
      primarySwatch: query.isEmpty ? Colors.grey : Colors.brown,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white30),
        contentPadding: EdgeInsetsDirectional.only(start: 8),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color,
        elevation: 0,
        iconTheme: IconThemeData(color: color2),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: query.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: shoplixColor,
                ),
                onPressed: () {
                  query = '';
                },
              )
            : const SizedBox(),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    final color2 = query.isEmpty ? shoplixOrange : shoplixColor;

    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: color2,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return ListView(children: [DetailBody()]);
    return Container();
    //Add the search term to the searchBloc.
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    timeDilation = 2;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: query.isNotEmpty
          ? SuggestionsList(query: query)
          : const RecentsList(),
    );
  }
}
