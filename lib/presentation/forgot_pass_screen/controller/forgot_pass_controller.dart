import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/forgot_pass_screen/models/forgot_pass_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPassScreen.
///
/// This class manages the state of the ForgotPassScreen, including the
/// current forgotPassModelObj
class ForgotPassController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

  Rx<ForgotPassModel> forgotPassModelObj = ForgotPassModel().obs;

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    newpasswordController1.dispose();
  }
}
