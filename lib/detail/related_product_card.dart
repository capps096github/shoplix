import '../app_exporter.dart';
import 'providers.dart';

class RelatedProductsCard extends StatelessWidget {
  const RelatedProductsCard({Key? key, required this.product})
      : super(key: key);
  final MenuItem product;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer(
      builder: (context, watch, child) {
        return Semantics(
          hint: 'View Details of ${product.name}',
          child: InkWell(
            onTap: () {
              final isRelatedItemScreen = watch(isRelatedItemsProvider).state;

              context.read(isRelatedItemsProvider).state = !isRelatedItemScreen;
              context.read(detailItemProvider).state = product;
            },
            child: child,
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kalyaOrange50,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            KalyaImage(
              imageUrl: product.imageUrl,
              height: 500,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: shoplixColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      // width: imageWidth,
                      width: 500, //!change this later
                      child: Text(
                        product.name,
                        style:
                            theme.textTheme.button?.copyWith(color: shoplixWhite),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatter.format(product.price),
                      style:
                          theme.textTheme.caption?.copyWith(color: shoplixWhite),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
