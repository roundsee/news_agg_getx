import '../controller/search_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchPageScreen.
///
/// This class ensures that the SearchPageController is created when the
/// SearchPageScreen is first loaded.
class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController());
  }
}
