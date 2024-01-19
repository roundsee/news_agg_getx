import 'package:get/get.dart';
import 'package:new_agg/core/controllers/search_result_controller.dart';

/// A binding class for the AlternativeHomePageDesignContainerScreen.
///
/// This class ensures that the AlternativeHomePageDesignContainerController is created when the
/// AlternativeHomePageDesignContainerScreen is first loaded.
class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController());
  }
}
