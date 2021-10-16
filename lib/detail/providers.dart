import '../app_exporter.dart';

final detailItemProvider = StateProvider<MenuItem?>((ref) =>null);


///This provides the current value of the
///[selected menu tab (food or drink menu)]
final isRelatedItemsProvider = StateProvider((ref) => false);