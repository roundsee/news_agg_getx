import '../controller/register_page_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegisterPageScreen.
///
/// This class ensures that the RegisterPageController is created when the
/// RegisterPageScreen is first loaded.
class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageController());
  }
}
