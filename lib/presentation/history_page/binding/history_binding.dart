import '../controller/history_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPassScreen.
///
/// This class ensures that the ForgotPassController is created when the
/// ForgotPassScreen is first loaded.
class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
