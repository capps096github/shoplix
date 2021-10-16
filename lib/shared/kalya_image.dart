import 'package:cached_network_image/cached_network_image.dart';

import '../app_exporter.dart';
import 'shoplix_logo.dart';

class KalyaImage extends StatelessWidget {
  const KalyaImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
    this.imageColor,
    this.showPlaceHolder = true,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit? fit;
  final double? height, width;
  final Color? imageColor;
  final bool showPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      errorWidget: (context, url, _) => const ShoplixLogo(),
      placeholder: (context, url) =>
          showPlaceHolder ? const ShoplixLogo() : const SizedBox(),
    );
  }
}
