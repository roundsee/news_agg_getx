import 'controller/forgot_pass_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/validation_functions.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPassOneScreen extends GetWidget<ForgotPassOneController> {
  ForgotPassOneScreen({Key? key}) : super(key: key);

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
                          controller: controller.emailController,
                          hintText: "lbl_email_address".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          }),
                      SizedBox(height: 22.v),
                      CustomElevatedButton(
                          text: "lbl_send_email".tr,
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .labelLargePoppinsWhiteA700SemiBold,
                          onPressed: () {
                            onTapSendEmail();
                          }),
                      SizedBox(height: 21.v),
                      Text("msg_havent_t_got_the".tr,
                          style: CustomTextStyles.bodySmallPoppins),
                      SizedBox(height: 8.v),
                      Text("lbl_resend_email".tr,
                          style: CustomTextStyles.bodySmallPoppinsPrimary),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Navigates to the forgotPassScreen when the action is triggered.
  onTapSendEmail() {
    Get.toNamed(
      AppRoutes.forgotPassScreen,
    );
  }
}
