import 'controller/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/validation_functions.dart';
import 'package:new_agg/widgets/custom_checkbox_button.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';
import 'package:new_agg/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class RegisterPageScreen extends GetWidget<RegisterPageController> {
  RegisterPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterPageController regController = Get.put(RegisterPageController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 39.h, vertical: 21.v),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(height: 7.v),
                        SizedBox(
                            height: 78.v,
                            width: 134.h,
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          height: 78.adaptSize,
                                          width: 78.adaptSize,
                                          decoration: BoxDecoration(
                                              color: appTheme.gray900,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      39.h)))),
                                  Align(
                                      alignment: Alignment(0.4, 0.0),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_ne".tr,
                                                style: CustomTextStyles
                                                    .titleLargeWhiteA700_1),
                                            TextSpan(
                                                text: "lbl_ws".tr,
                                                style: CustomTextStyles
                                                    .titleLargeGray900),
                                            TextSpan(
                                                text: "lbl_a".tr,
                                                style:
                                                    theme.textTheme.titleLarge)
                                          ]),
                                          textAlign: TextAlign.left))
                                ])),
                        SizedBox(height: 46.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 35.h),
                                child: Text("msg_sign_up_to_your".tr,
                                    style: theme.textTheme.titleMedium))),
                        SizedBox(height: 27.v),
                        _buildSignUpWithGoogle(),
                        SizedBox(height: 23.v),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 7.v, bottom: 6.v),
                                  child:
                                      SizedBox(width: 86.h, child: Divider())),
                              Text("msg_or_continue_with".tr,
                                  style: CustomTextStyles
                                      .bodySmallPoppinsGray50001),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 7.v, bottom: 6.v),
                                  child:
                                      SizedBox(width: 86.h, child: Divider()))
                            ]),
                        SizedBox(height: 21.v),
                        _buildName(),
                        SizedBox(height: 9.v),
                        _buildEmail(),
                        SizedBox(height: 9.v),
                        _buildPassword(),
                        SizedBox(height: 9.v),
                        _buildConfirmPassword(),
                        SizedBox(height: 15.v),
                        _buildIVeReadAndAgree(),
                        SizedBox(height: 9.v),
                        _buildSignUp(),
                        SizedBox(height: 25.v),
                        GestureDetector(
                            onTap: () {
                              onTapTxtYouhaveanaccount();
                            },
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_you_have_an_account2".tr,
                                      style:
                                          CustomTextStyles.labelLargePoppins),
                                  TextSpan(
                                      text: "lbl_sign_in".tr,
                                      style: CustomTextStyles
                                          .bodySmallPoppinsIndigo700)
                                ]),
                                textAlign: TextAlign.left))
                      ]),
                    )))));
  }

  /// Section Widget
  Widget _buildSignUpWithGoogle() {
    return CustomOutlinedButton(
        height: 36.v,
        text: "msg_sign_up_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLogosgoogleicon,
                height: 18.adaptSize,
                width: 18.adaptSize)),
        buttonStyle: CustomButtonStyles.outlineOnPrimary,
        buttonTextStyle: CustomTextStyles.labelMediumPoppinsOnErrorBold,
        onPressed: () {
          onTapSignUpWithGoogle();
        });
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
        controller: regController.nameController,
        hintText: "lbl_name".tr,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
        controller: regController.emailController,
        hintText: "lbl_email_address".tr,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPassword() {
    return CustomTextFormField(
        controller: regController.passwordController,
        hintText: "lbl_password".tr,
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true);
  }

  /// Section Widget
  Widget _buildConfirmPassword() {
    return CustomTextFormField(
        controller: regController.confirmPasswordController,
        hintText: "msg_confirm_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true);
  }

  /// Section Widget
  Widget _buildIVeReadAndAgree() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 2.h, right: 25.h),
            child: Obx(() => CustomCheckboxButton(
                alignment: Alignment.centerLeft,
                text: "msg_i_ve_read_and_agree".tr,
                isExpandedText: true,
                value: controller.iVeReadAndAgree.value,
                onChange: (value) {
                  controller.iVeReadAndAgree.value = value;
                }))));
  }

  /// Section Widget
  Widget _buildSignUp() {
    return CustomElevatedButton(
        height: 36.v,
        text: "lbl_sign_up".tr,
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.labelLargePoppinsWhiteA700_1,
        onPressed: () {
          onTapSignUp();
        });
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapSignUpWithGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Navigates to the selectFavCategoryScreen when the action is triggered.
  onTapSignUp() {
    regController.registerWithEmail();
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtYouhaveanaccount() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
