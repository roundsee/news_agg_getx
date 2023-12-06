import '../controller/forgot_pass_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPassOneScreen.
///
/// This class ensures that the ForgotPassOneController is created when the
/// ForgotPassOneScreen is first loaded.
class ForgotPassOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassOneController());
  }
}
