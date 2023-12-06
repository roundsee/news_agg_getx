import '../controller/alternative_home_page_design_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AlternativeHomePageDesignOneScreen.
///
/// This class ensures that the AlternativeHomePageDesignOneController is created when the
/// AlternativeHomePageDesignOneScreen is first loaded.
class AlternativeHomePageDesignOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlternativeHomePageDesignOneController());
  }
}
