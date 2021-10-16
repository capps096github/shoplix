import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../app_exporter.dart';
import 'fav_bottom_navbar.dart';
import 'favorite_hive_list.dart';
import 'favorites_banner.dart';
import 'providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final favoritesHive = watch(favoritesProvider);
    return Scaffold(
      backgroundColor: kalyaFavoriteBacground,
      appBar: AppBar(
        backgroundColor: kalyaFavoritePink,
        elevation: 8,
        leading: const CloseButton(
          color: kalyaWhite,
        ),
        title: const Text('Favorites'),
      ),
      body: favoritesHive.favoritesBox.isNotEmpty
          ? const PaddedColumn(
              padding: EdgeInsets.all(8),
              children: [
                FavoritesBanner(),
                VerticalSpacing(of: 8),
                Expanded(child: FavoriteHiveList()),
              ],
            )
          : const Center(
              child: FavoriteHeart(),
            ),
      // : NoFavorites(),

      bottomNavigationBar: const FavBottomNavBar(),
    );
  }
}

class NoFavorites extends StatelessWidget {
  const NoFavorites({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          FavoriteHeart(),
          Center(
            child: Text(
              'Add\n "Your Favorite Foods and Drinks"\n Here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kalyaFavoritePink,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteHeart extends StatefulWidget {
  const FavoriteHeart({Key? key}) : super(key: key);
  @override
  _FavoriteHeartState createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('lottie/favorites_heart.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(
            composition: composition,
            height: 200,
            width: 200,
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: kalyaFavoritePink,
          ));
        }
      },
    );
  }
}
