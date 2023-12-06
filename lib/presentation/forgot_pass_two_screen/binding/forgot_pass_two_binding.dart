import '../controller/forgot_pass_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPassTwoScreen.
///
/// This class ensures that the ForgotPassTwoController is created when the
/// ForgotPassTwoScreen is first loaded.
class ForgotPassTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassTwoController());
  }
}
