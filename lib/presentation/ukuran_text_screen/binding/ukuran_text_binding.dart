import '../controller/ukuran_text_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UkuranTextScreen.
///
/// This class ensures that the UkuranTextController is created when the
/// UkuranTextScreen is first loaded.
class UkuranTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UkuranTextController());
  }
}
