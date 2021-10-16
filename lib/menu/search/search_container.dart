import '../../app_exporter.dart';
import 'search-delegate/kalya_search.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      constraints: const BoxConstraints(maxWidth: 900),
      decoration: BoxDecoration(
        color: kalyaWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
                Icons.search,
                color: Colors.brown.shade900,
                size: 22,
            ),
          ),
          Expanded(
            child: AnimatedTextKit(
              animatedTexts: [
                buildTypewriterAnimatedText('Search through the Menu'),
                buildTypewriterAnimatedText('Search for any Food'),
                buildTypewriterAnimatedText('Search for any Drink'),
                buildTypewriterAnimatedText('Search for Foods & Drinks'),
              ],
              // Show Search on Tap
              onTap: () => showSearch(
                context: context,
                delegate: KalyaSearch(
                  hintText: 'Search a Food or Drink',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.tune,
              color: kalyaBrown900,
              semanticLabel: 'filter',
            ),
          ),
        ],
      ),
    );
  }

  TypewriterAnimatedText buildTypewriterAnimatedText(String text) {
    return TypewriterAnimatedText(
      text,
      textAlign: TextAlign.center,
      speed: const Duration(milliseconds: 80),
      cursor: '|',
      curve: Curves.easeIn,
      textStyle: const TextStyle(
        color: kalyaBrown900,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
