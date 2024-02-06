import 'package:cool_alert/cool_alert.dart';
import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            appBar: AppBar(
                leadingWidth: 49.h,
                leading: BackButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_settings".tr)),
            //_buildAppBar(),
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
                  _buildFrameSixtyNine(
                      notificationText: "lbl_notifikasi".tr,
                      onTapFrameSixtyNine: () {
                        onTapNotifikasi();
                      }),
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
                          ]))),
                  //_buildLogout(),
                  SizedBox(
                      height: 24.v,
                      width: 310.h,
                      child: Stack(alignment: Alignment.centerRight, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("lbl_keluar".tr,
                                style: CustomTextStyles.labelLargeMedium)),
                        GestureDetector(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                alignment: Alignment.centerRight),
                            onTap: () {
                              CoolAlert.show(
                                context: context,
                                title: "Keluar Aplikasi",
                                type: CoolAlertType.confirm,
                                text: 'Do you want to logout',
                                confirmBtnText: 'Yes',
                                cancelBtnText: 'No',
                                confirmBtnColor: Colors.green,
                                onConfirmBtnTap: () {
                                  controller.Logout();
                                  // Get.off(LoginPageScreen());
                                },
                              );
                              //onTapFrameSixtyNine!.call();
                            }),

                        //_buildFrameSixtyNine(notificationText: "lbl_keluar".tr)
                        /*
                        GestureDetector(
                          onTap: () {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.confirm,
                              text: 'Do you want to logout',
                              confirmBtnText: 'Yes',
                              cancelBtnText: 'No',
                              confirmBtnColor: Colors.green,
                            );
                          },
                        )
                        */
                      ])),
                  SizedBox(height: 10.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_hapus_akun".tr,
                              style: CustomTextStyles.labelLargeMedium)),
                      GestureDetector(
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            title: "Hapus Akun",
                            type: CoolAlertType.confirm,
                            text:
                                'Apakah Anda yakin ingin menghapus akun anda ?',
                            confirmBtnText: 'Yes',
                            cancelBtnText: 'No',
                            confirmBtnColor: Colors.lightBlue,
                            onConfirmBtnTap: () {
                              controller.Logout();
                              // Get.off(LoginPageScreen());
                            },
                          );
                        },
                        child: CustomImageView(
                            imagePath: ImageConstant.imgArrowRight,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            alignment: Alignment.centerRight),
                      ),
                    ],
                  ),
//=====================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("lbl_change_password".tr,
                              style: CustomTextStyles.labelLargeMedium)),
                      GestureDetector(
                        onTap: () {
                          //_ChangePassword()
                        },
                        child: CustomImageView(
                            imagePath: ImageConstant.imgArrowRight,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            alignment: Alignment.centerRight),
                      ),
                    ],
                  ),

//=====================
//                  SizedBox(height: 9.v),
//                  _buildFrameSixtyNine(
//                      notificationText: "msg_aktifkan_ulang_akun".tr),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_berita".tr,
                          style: CustomTextStyles.bodySmallGray70003)),
                  _buildFrameSixtyNine(
                      notificationText: "msg_berita_yang_disarankan".tr,
                      onTapFrameSixtyNine: () {}),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("lbl_dukungan".tr,
                          style: CustomTextStyles.bodySmallGray70003)),
                  SizedBox(height: 5.v),
                  _buildFrameSixtyNine(
                      notificationText: "lbl_tentang".tr,
                      onTapFrameSixtyNine: () {})
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
              Get.back();
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
          //_buildFrameSixtyNine(notificationText: "lbl_keluar".tr)
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

  onTapNotifikasi() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }
//===============================

//===============================
}
