import 'controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/validation_functions.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';
import 'package:new_agg/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends GetWidget<LoginPageController> {
  LoginPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginPageController inputloginController = Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 39.h, vertical: 21.v),
                      child: Column(children: [
                        SizedBox(height: 38.v),
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
                        SizedBox(height: 52.v),
                        Text("lbl_sign_in_to_your".tr,
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 27.v),
                        _buildSignInWithGoogle(),
                        SizedBox(height: 23.v),
                        Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 7.v, bottom: 6.v),
                                      child: SizedBox(
                                          width: 86.h, child: Divider())),
                                  Text("lbl_or_continue_with".tr,
                                      style: CustomTextStyles
                                          .bodySmallPoppinsGray50001),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 7.v, bottom: 6.v),
                                      child: SizedBox(
                                          width: 86.h, child: Divider()))
                                ])),
                        SizedBox(height: 21.v),
                        _buildEmail(),
                        SizedBox(height: 9.v),
                        _buildPassword(),
                        SizedBox(height: 7.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 3.h),
                                child: Text("err_passwords_or_email".tr,
                                    style: CustomTextStyles
                                        .bodySmallPoppinsRed700))),
                        SizedBox(height: 17.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtForgotPassword();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: Text("msg_forgot_password".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsGray50001
                                            .copyWith(
                                                decoration: TextDecoration
                                                    .underline))))),
                        SizedBox(height: 7.v),
                        _buildSignIn(),
                        SizedBox(height: 78.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  onTapTxtDonthaveanaccount();
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_don_t_have_an_account2".tr,
                                          style: CustomTextStyles
                                              .labelLargePoppins),
                                      TextSpan(
                                          text: "lbl_create_account".tr,
                                          style: CustomTextStyles
                                              .bodySmallPoppinsIndigo700)
                                    ]),
                                    textAlign: TextAlign.left)))
                      ]))),
            )));
  }

  /// Section Widget
  Widget _buildSignInWithGoogle() {
    return CustomOutlinedButton(
        height: 36.v,
        text: "msg_sign_in_with_google".tr,
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 10.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLogosgoogleicon,
                height: 18.adaptSize,
                width: 18.adaptSize)),
        buttonTextStyle: CustomTextStyles.labelMediumPoppinsOnErrorBold,
        onPressed: () {
          onTapSignInWithGoogle();
        });
  }

  /// Section Widget
  Widget _buildEmail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: CustomTextFormField(
            controller: inputloginController.emailController,
            hintText: "lbl_email_address".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildPassword() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: CustomTextFormField(
            controller: inputloginController.passwordController,
            hintText: "lbl_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSignIn() {
    return CustomElevatedButton(
        height: 36.v,
        text: "lbl_sign_in".tr,
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.labelLargePoppinsWhiteA700_1,
        onPressed: () => inputloginController.loginWithEmail()
        /*
        onPressed: () {
          onTapSignIn();
        }
        */
        );
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapSignInWithGoogle() async {
    await GoogleAuthHelper().googleSignOutProcess();

    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        LoginPageController().loginSSO(googleUser);
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      print(onError.toString());
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Navigates to the forgotPassOneScreen when the action is triggered.
  onTapTxtForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassOneScreen);
  }

  /// Navigates to the alternativeHomePageDesignContainerScreen when the action is triggered.
  onTapSignIn() {
    // ignore: unnecessary_statements
    LoginPageController().loginWithEmail();
    Get.toNamed(AppRoutes.homePageWithTabPage);
  }

  /// Navigates to the registerPageScreen when the action is triggered.
  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.registerPageScreen,
    );
  }
}
