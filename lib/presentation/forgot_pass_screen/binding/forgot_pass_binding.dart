import '../controller/forgot_pass_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPassScreen.
///
/// This class ensures that the ForgotPassController is created when the
/// ForgotPassScreen is first loaded.
class ForgotPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassController());
  }
}
