import '../controller/fav_category_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FavCategoryScreen.
///
/// This class ensures that the FavCategoryController is created when the
/// FavCategoryScreen is first loaded.
class FavCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavCategoryController());
  }
}
