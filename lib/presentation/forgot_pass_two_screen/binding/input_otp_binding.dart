import 'package:get/get.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/controller/input_otp_controller.dart';

/// A binding class for the ForgotPassOneScreen.
///
/// This class ensures that the ForgotPassOneController is created when the
/// ForgotPassOneScreen is first loaded.
class InputOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputOTPController());
  }
}
