import 'controller/forgot_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/validation_functions.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPassScreen extends GetWidget<ForgotPassController> {
  ForgotPassScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 42.h, top: 123.v, right: 42.h),
                    child: Column(children: [
                      Text("msg_forgot_password".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      SizedBox(
                          width: 175.h,
                          child: Text("msg_enter_your_email".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.bodySmallPoppinsGray60002)),
                      SizedBox(height: 14.v),
                      CustomTextFormField(
                          controller: controller.newpasswordController,
                          hintText: "lbl_new_password".tr,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: true),
                      SizedBox(height: 10.v),
                      CustomTextFormField(
                          controller: controller.newpasswordController1,
                          hintText: "msg_confirm_new_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_password".tr;
                            }
                            return null;
                          },
                          obscureText: true),
                      SizedBox(height: 20.v),
                      CustomElevatedButton(
                          text: "lbl_reset_password".tr,
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .labelLargePoppinsWhiteA700SemiBold,
                          onPressed: () {
                            onTapResetPassword();
                          }),
                      SizedBox(height: 23.v),
                      Text("msg_don_t_need_to_do".tr,
                          style: CustomTextStyles.bodySmallPoppins),
                      SizedBox(height: 11.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtLogIn();
                          },
                          child: Text("lbl_log_in".tr,
                              style: CustomTextStyles.bodySmallPoppinsPrimary)),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Navigates to the forgotPassTwoScreen when the action is triggered.
  onTapResetPassword() {
    Get.toNamed(
      AppRoutes.forgotPassTwoScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtLogIn() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
