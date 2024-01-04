import 'package:get/get.dart';
import 'package:new_agg/core/controllers/news_per_cagory_controller.dart';
import 'package:new_agg/presentation/page_search_category/page_search_category.dart';

/// A binding class for the AlternativeHomePageDesignContainerScreen.
///
/// This class ensures that the AlternativeHomePageDesignContainerController is created when the
/// AlternativeHomePageDesignContainerScreen is first loaded.
class PageSearchCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsPerCategoryController());
  }
}
