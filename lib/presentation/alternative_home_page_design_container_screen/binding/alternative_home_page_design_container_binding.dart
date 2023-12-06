import '../controller/alternative_home_page_design_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AlternativeHomePageDesignContainerScreen.
///
/// This class ensures that the AlternativeHomePageDesignContainerController is created when the
/// AlternativeHomePageDesignContainerScreen is first loaded.
class AlternativeHomePageDesignContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlternativeHomePageDesignContainerController());
  }
}
