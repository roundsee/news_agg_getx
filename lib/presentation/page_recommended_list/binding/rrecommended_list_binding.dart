import 'package:get/get.dart';
import 'package:new_agg/core/controllers/recommended_list_controller.dart';

/// A binding class for the AlternativeHomePageDesignContainerScreen.
///
/// This class ensures that the AlternativeHomePageDesignContainerController is created when the
/// AlternativeHomePageDesignContainerScreen is first loaded.
class RecommendedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendedListController());
  }
}
