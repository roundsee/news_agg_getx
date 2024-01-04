import 'package:new_agg/presentation/home_page_with_tab_page/home_page_with_tab_page.dart';
import 'package:get/get.dart';

/// A binding class for the AlternativeHomePageDesignContainerScreen.
///
/// This class ensures that the AlternativeHomePageDesignContainerController is created when the
/// AlternativeHomePageDesignContainerScreen is first loaded.
class HomePageWithTabPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageWithTabPage());
  }
}
