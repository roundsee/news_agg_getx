import '../controller/select_fav_category_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectFavCategoryScreen.
///
/// This class ensures that the SelectFavCategoryController is created when the
/// SelectFavCategoryScreen is first loaded.
class SelectFavCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectFavCategoryController());
  }
}
