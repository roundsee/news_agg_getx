import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/validation_functions.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/controller/input_otp_controller.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class InputOTPScreen extends GetWidget<InputOTPController> {
  InputOTPScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late Timer _timer;
    int _startTime = 15;
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
                      Text(
                          "Please check your mailbox, we have sent OTP ", //"msg_forgot_password".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      Text("OTP", //"msg_forgot_password".tr,
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 8.v),
                      SizedBox(
                          width: 175.h,
                          child: Text("Input OTP",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  CustomTextStyles.bodySmallPoppinsGray60002)),
                      SizedBox(height: 14.v),
                      CustomTextFormField(
                        controller: controller.otpText,
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
                      CustomElevatedButton(
                          text: "Submit",
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .labelLargePoppinsWhiteA700SemiBold,
                          onPressed: () {
                            onTapSendEmail();
                          }),
                      SizedBox(height: 21.v),
                      GestureDetector(
                        onTap: () {
                          controller.ResendOTP();
                        },
                        child: Text("Resend OTP",
                            style: CustomTextStyles.bodySmallPoppins),
                      ),
                      SizedBox(height: 8.v),
                      CountdownTimer(
                        onEnd: () {},
                        endTime: 60,
                      )
                    ])))));
  }

  /// Navigates to the forgotPassScreen when the action is triggered.
  onTapSendEmail() {
    controller.SubmitOTP();
    //Get.toNamed(
    //  AppRoutes.forgotPassScreen,
    //);
  }
}
