import '../app_exporter.dart';

///[For confirming wether the user has finished ordering]
final isOrderConfirmedProvider = StateProvider((ref) => false);
final isUploadingOrderProvider = StateProvider((ref) => false);

/// The belong to the FewClicks to oreder
final isTimeDate1SetProvider = StateProvider((ref) => false);
final isTimeDateSetProvider = StateProvider((ref) => false);
final isAnimationDoneProvider = StateProvider((ref) => false);

///For detecting wether image was saved to gallery
final isOrderSavedToGalleryProvider = StateProvider((ref) => false);

///`Date for the order`
final orderDateProvider = StateProvider(
  (ref) => DateTime.now(),
);

///`Time for the order`
final orderTimeProvider = StateProvider(
  (ref) => TimeOfDay.now(),
);

///`All in one for the order`
final orderTimeAndDateProvider = Provider<DateTime>(
  (ref) {
    final date = ref.watch(orderDateProvider).state;
    final time = ref.watch(orderTimeProvider).state;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  },
);

///`All in one for the order`
final currentTimeAndDateProvider = Provider<DateTime>(
  (ref) {
    final date = DateTime.now();
    final time = TimeOfDay.now();

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  },
);
