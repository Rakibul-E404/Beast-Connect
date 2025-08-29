import 'package:get/get.dart';

class SubscriptionCardController extends GetxController {
  var showAll = false.obs;

  /// Default initial item count
  final int defaultInitialItemCount = 3;

  /// Toggle showAll
  void toggleShowAll() {
    showAll.value = !showAll.value;
  }

  /// Safely get number of items to show
  int getSafeInitialCount(int listLength) {
    return listLength < defaultInitialItemCount
        ? listLength
        : defaultInitialItemCount;
  }
}
