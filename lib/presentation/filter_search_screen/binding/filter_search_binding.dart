import '../controller/filter_search_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FilterSearchScreen.
///
/// This class ensures that the FilterSearchController is created when the
/// FilterSearchScreen is first loaded.
class FilterSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterSearchController());
  }
}
