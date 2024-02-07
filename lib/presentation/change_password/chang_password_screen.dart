import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/change_password/change_password_controller.dart';
import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends GetWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  ChangePasswordController controller = Get.put(ChangePasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = TextEditingController();
    TextEditingController passWord = TextEditingController();
    TextEditingController retypepassword = TextEditingController();

    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                            left: 42.h, top: 123.v, right: 42.h),
                        child: Column(children: [
                          Text("Change Password", //"msg_forgot_password".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 8.v),
                          SizedBox(
                              width: 175.h,
                              child: Text("Input Old Password",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .bodySmallPoppinsGray60002)),
                          SizedBox(height: 8.v),
                          CustomTextFormField(
                            controller: controller.oldPass,
                            //hintText: "lbl_email_address".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            //validator: (value) {
                            //  if (value == null ||
                            //      (!isValidEmail(value, isRequired: true))) {
                            //    return "err_msg_please_enter_valid_email".tr;
                            //  }
                            //  return null;
                            // }
                          ),
                          SizedBox(
                              width: 175.h,
                              child: Text("Input New Password",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .bodySmallPoppinsGray60002)),
                          SizedBox(height: 8.v),
                          CustomTextFormField(
                            controller: controller.newPass,
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
                                  style: CustomTextStyles
                                      .bodySmallPoppinsGray60002)),
                          SizedBox(height: 14.v),
                          CustomTextFormField(
                              controller: controller.retypePass,
                              //hintText: "lbl_email_address".tr,
                              textInputAction: TextInputAction.done,
                              //textInputType: TextInputType.text,

                              validator: (value) {
                                if (value == null ||
                                    //(!isValidEmail(value, isRequired: true))
                                    controller.newPass !=
                                        controller.retypePass.text) {
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
                                onTapSendEmail();
                              }),
                          SizedBox(height: 21.v),
                          CustomElevatedButton(
                              text: "Cancel Change Password",
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle: CustomTextStyles
                                  .labelLargePoppinsWhiteA700SemiBold,
                              onPressed: () {
                                Get.back();
                              })
                        ]))),
              ),
            )));
  }

  /// Navigates to the forgotPassScreen when the action is triggered.
  onTapSendEmail() {
    controller.SubmitNewPass();
    //Get.toNamed(
    //  AppRoutes.forgotPassScreen,
    //);
  }
}
