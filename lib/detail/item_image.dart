import '../app_exporter.dart';

///Constants
const double detailImageHeight = 470;
const double sizeHW = 450;
const double rightPosition = -120;
const double top = -28;

class ItemImage extends StatelessWidget {
  const ItemImage({Key? key, required this.menuItem}) : super(key: key);
  final MenuItem menuItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: detailImageHeight,
      child: Stack(
        children: [
          const Positioned(
            right: rightPosition,
            top: top,
            child: SizedBox(
              height: sizeHW,
              width: sizeHW,
              child: Card(
                shape: CircleBorder(),
                color: shoplixColor,
                shadowColor: shoplixColor,
              ),
            ),
          ),
          Positioned(
            right: rightPosition,
            top: top - 2,
            child: SizedBox(
              height: sizeHW,
              width: sizeHW,
              child: Card(
                shape: const CircleBorder(),
                color: shoplixWhite,
                elevation: 8,
                child: ClipOval(
                  child: KalyaImage(
                    imageUrl: menuItem.imageUrl,
                    height: sizeHW,
                    width: sizeHW,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
