import 'controller/side_bar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

class SideBarPageDraweritem extends StatelessWidget {
  SideBarPageDraweritem(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  SideBarPageController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Drawer(
      child: Container(
        width: 269.h,
        padding: EdgeInsets.all(25.h),
        decoration: AppDecoration.outlineBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGgDarkMode,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "lbl_light_mode".tr,
                    style: CustomTextStyles.bodySmallGray70004,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.v),
            Divider(
              indent: 2.h,
            ),
            SizedBox(height: 25.v),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Text(
                "lbl_kategori".tr,
                style: CustomTextStyles.labelLargeGray800,
              ),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMapPolitical,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "lbl_politik".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentBezierC,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_economy".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSimpleIconsBitcoinsv,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_crypto".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSolarHealthBold,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "lbl_health".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentEmojiHi,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_sports".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMaterialSymbolsBoxEdit,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "lbl_pemilu_2024".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgShare,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 5.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_technology".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEntypoGlobe,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "lbl_dunia".tr,
                      style: CustomTextStyles.labelLargeSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
          ],
        ),
      ),
    );
  }
}
