import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/models/forgot_pass_two_model.dart';

/// A controller class for the ForgotPassTwoScreen.
///
/// This class manages the state of the ForgotPassTwoScreen, including the
/// current forgotPassTwoModelObj
class ForgotPassTwoController extends GetxController {
  Rx<ForgotPassTwoModel> forgotPassTwoModelObj = ForgotPassTwoModel().obs;
}
