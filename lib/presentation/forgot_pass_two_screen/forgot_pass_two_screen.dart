import 'controller/forgot_pass_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_icon_button.dart';

class ForgotPassTwoScreen extends GetWidget<ForgotPassTwoController> {
  const ForgotPassTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 42.h, top: 102.v, right: 42.h),
                child: Column(children: [
                  SizedBox(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      child: Stack(alignment: Alignment.center, children: [
                        CustomIconButton(
                            height: 58.adaptSize,
                            width: 58.adaptSize,
                            padding: EdgeInsets.all(17.h),
                            alignment: Alignment.center,
                            child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgMingcuteCheck2Fill)),
                        CustomIconButton(
                            height: 58.adaptSize,
                            width: 58.adaptSize,
                            padding: EdgeInsets.all(17.h),
                            alignment: Alignment.center,
                            child: CustomImageView(
                                imagePath: ImageConstant.imgMingcuteCheck2Fill))
                      ])),
                  SizedBox(height: 27.v),
                  Text("msg_password_reset_complete".tr,
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 8.v),
                  Container(
                      width: 270.h,
                      margin: EdgeInsets.only(left: 2.h, right: 3.h),
                      child: Text("msg_your_password_reset".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodySmallPoppinsGray60002)),
                  SizedBox(height: 24.v),
                  CustomElevatedButton(
                      text: "lbl_go_to_log_in".tr,
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle:
                          CustomTextStyles.labelLargePoppinsWhiteA700SemiBold,
                      onPressed: () {
                        onTapGoToLogIn();
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapGoToLogIn() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
