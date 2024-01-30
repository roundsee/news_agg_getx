import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/controller/forgot_pass_two_controller.dart';
import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPassTwoScreen extends GetWidget {
  ForgotPassTwoScreen({Key? key}) : super(key: key);
  ForgotPassTwoController controller = Get.put(ForgotPassTwoController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController passWord = TextEditingController();
    TextEditingController retypepassword = TextEditingController();

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
                      Text("Reset Password", //"msg_forgot_password".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      SizedBox(
                          width: 175.h,
                          child: Text("Input New Password",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.bodySmallPoppinsGray60002)),
                      SizedBox(height: 8.v),
                      CustomTextFormField(
                        controller: controller.passText,
                        //hintText: "lbl_email_address".tr,
                        textInputAction: TextInputAction.done,
                        //textInputType: TextInputType.emailAddress,
                        //validator: (value) {
                        //  if (value == null ||
                        //      (!isValidEmail(value, isRequired: true))) {
                        //    return "err_msg_please_enter_valid_email".tr;
                        //  }
                        //  return null;
                        // }
                      ),
                      SizedBox(height: 22.v),
                      SizedBox(
                          width: 175.h,
                          child: Text("Re-Type Password",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.bodySmallPoppinsGray60002)),
                      SizedBox(height: 14.v),
                      CustomTextFormField(
                          controller: controller.retypeText,
                          //hintText: "lbl_email_address".tr,
                          textInputAction: TextInputAction.done,
                          //textInputType: TextInputType.text,

                          validator: (value) {
                            if (value == null ||
                                //(!isValidEmail(value, isRequired: true))
                                passWord.text != retypepassword.text) {
                              return "Enter Valid Password ";
                            }
                            return null;
                          }),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                          text: "Submit",
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .labelLargePoppinsWhiteA700SemiBold,
                          onPressed: () {
                            onTapSendEmail(controller.passText.text);
                          }),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                          text: "Cancel Reset Password",
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .labelLargePoppinsWhiteA700SemiBold,
                          onPressed: () {
                            Get.off(LoginPageScreen());
                          })
                    ])))));
  }

  /// Navigates to the forgotPassScreen when the action is triggered.
  onTapSendEmail(String NewPass) {
    controller.SubmitNewPass(NewPass);
    //Get.toNamed(
    //  AppRoutes.forgotPassScreen,
    //);
  }
}
