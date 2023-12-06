import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_subtitle.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 5.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_akun".tr,
                          style: CustomTextStyles.bodySmallGray70003)),
                  _buildFrameSixtyNine(
                      notificationText: "lbl_edit_profil".tr,
                      onTapFrameSixtyNine: () {
                        onTapFrameSixtyEight();
                      }),
                  SizedBox(height: 10.v),
                  _buildFrameSixtyNine(notificationText: "lbl_notifikasi".tr),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                          height: 15.v,
                          width: 38.h,
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text("lbl_masuk".tr,
                                    style:
                                        CustomTextStyles.bodySmallGray70003)),
                            Align(
                                alignment: Alignment.center,
                                child: Text("lbl_masuk".tr,
                                    style: CustomTextStyles.bodySmallGray70003))
                          ]))),
                  _buildLogout(),
                  SizedBox(height: 10.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_hapus_akun".tr,
                          style: CustomTextStyles.labelLargeMedium)),
                  SizedBox(height: 9.v),
                  _buildFrameSixtyNine(
                      notificationText: "msg_aktifkan_ulang_akun".tr),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_berita".tr,
                          style: CustomTextStyles.bodySmallGray70003)),
                  _buildFrameSixtyNine(
                      notificationText: "msg_berita_yang_disarankan".tr),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_dukungan".tr,
                          style: CustomTextStyles.bodySmallGray70003)),
                  SizedBox(height: 5.v),
                  _buildFrameSixtyNine(notificationText: "lbl_tentang".tr)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 14.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_settings".tr));
  }

  /// Section Widget
  Widget _buildLogout() {
    return SizedBox(
        height: 24.v,
        width: 310.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("lbl_keluar".tr,
                  style: CustomTextStyles.labelLargeMedium)),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.centerRight),
          _buildFrameSixtyNine(notificationText: "lbl_keluar".tr)
        ]));
  }

  /// Common widget
  Widget _buildFrameSixtyNine({
    required String notificationText,
    Function? onTapFrameSixtyNine,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFrameSixtyNine!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 4.v),
              child: Text(notificationText,
                  style: CustomTextStyles.labelLargeMedium
                      .copyWith(color: appTheme.black900))),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 24.adaptSize,
              width: 24.adaptSize)
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapFrameSixtyEight() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
