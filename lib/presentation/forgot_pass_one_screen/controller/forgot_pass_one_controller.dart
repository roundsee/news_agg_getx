import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/forgot_pass_one_screen/models/forgot_pass_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ForgotPassOneScreen.
///
/// This class manages the state of the ForgotPassOneScreen, including the
/// current forgotPassOneModelObj
class ForgotPassOneController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPassOneModel> forgotPassOneModelObj = ForgotPassOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
