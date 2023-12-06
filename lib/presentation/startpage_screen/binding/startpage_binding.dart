import '../controller/startpage_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StartpageScreen.
///
/// This class ensures that the StartpageController is created when the
/// StartpageScreen is first loaded.
class StartpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartpageController());
  }
}
