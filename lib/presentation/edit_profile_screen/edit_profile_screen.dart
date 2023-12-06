import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_subtitle.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_button.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 33.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse3103x103,
                          height: 103.adaptSize,
                          width: 103.adaptSize,
                          radius: BorderRadius.circular(51.h),
                          alignment: Alignment.center),
                      SizedBox(height: 17.v),
                      CustomOutlinedButton(
                          height: 35.v,
                          width: 43.h,
                          text: "lbl_edit".tr,
                          buttonStyle: CustomButtonStyles.outlineOnErrorTL5,
                          buttonTextStyle: CustomTextStyles.labelLargeOnError,
                          alignment: Alignment.center),
                      SizedBox(height: 44.v),
                      SizedBox(
                          width: 52.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_nama".tr,
                                    style: CustomTextStyles.bodySmallGray80001),
                                TextSpan(
                                    text: "lbl_merdefi".tr,
                                    style: CustomTextStyles.titleSmallBlack900)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 21.v),
                      Container(
                          width: 262.h,
                          margin: EdgeInsets.only(right: 37.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_username".tr,
                                    style: CustomTextStyles.bodySmallGray80001),
                                TextSpan(
                                    text: "msg_muhammadidrisme".tr,
                                    style: CustomTextStyles.titleSmallBlack900)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 17.v),
                      SizedBox(
                          width: 84.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_tanggal_lahir".tr,
                                    style: CustomTextStyles.bodySmallGray80001),
                                TextSpan(
                                    text: "lbl_23_mar_2001".tr,
                                    style: CustomTextStyles.titleSmallBlack900)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 20.v),
                      SizedBox(
                          width: 77.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_jenis_kelamin".tr,
                                    style: CustomTextStyles.bodySmallGray80001),
                                TextSpan(
                                    text: "lbl_laki_laki".tr,
                                    style: CustomTextStyles.titleSmallBlack900)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 80.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray60004,
            margin: EdgeInsets.only(left: 25.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_edit_profile".tr, margin: EdgeInsets.only(left: 70.h)),
        actions: [
          AppbarTrailingButton(
              margin: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
              onTap: () {
                onTapSimpan();
              })
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapSimpan() {
    Get.toNamed(
      AppRoutes.profileScreen,
    );
  }
}
