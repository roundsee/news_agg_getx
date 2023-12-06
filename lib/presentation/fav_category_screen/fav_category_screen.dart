import 'controller/fav_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_subtitle.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

class FavCategoryScreen extends GetWidget<FavCategoryController> {
  FavCategoryScreen({Key? key}) : super(key: key);

  FavCategoryController favController = Get.put(FavCategoryController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 8.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 240.h,
                          margin: EdgeInsets.only(right: 61.h),
                          child: Text("msg_pilih_kategori_favorit".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.headlineSmallInter))),
                  SizedBox(height: 12.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                          width: 201.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_pilih".tr,
                                    style: theme.textTheme.bodyLarge),
                                TextSpan(
                                    text: "msg_5_kategori_yang".tr,
                                    style: CustomTextStyles
                                        .titleMediumInterGray70006)
                              ]),
                              textAlign: TextAlign.left))),
                  SizedBox(height: 22.v),

/*
                  CustomTextFormField(
                      controller: favController.ionsearchcircleController,
                      hintText: "lbl_bisnis".tr,
                      hintStyle: CustomTextStyles.bodySmallGray900,
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: EdgeInsets.all(10.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgIonsearchcircle,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      prefixConstraints: BoxConstraints(maxHeight: 44.v),
                      contentPadding: EdgeInsets.only(
                          top: 14.v, right: 30.h, bottom: 14.v)),
*/
                  SizedBox(height: 11.v),
/*
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 1.v, bottom: 3.v),
                                child: Text("lbl_bisnis".tr,
                                    style: CustomTextStyles.bodyMediumGray900)),
                            CustomImageView(
                                imagePath: ImageConstant.imgTypcnPlus,
                                height: 24.adaptSize,
                                width: 24.adaptSize)
                          ])),
*/
                  SizedBox(height: 47.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("lbl_kategori_kamu".tr,
                              style: CustomTextStyles.titleSmallBold15))),
                  SizedBox(height: 11.v),
                  _buildFrameNinetySix(),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildFrame(politicsText: "lbl_politics".tr)),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildFrame(politicsText: "lbl_politics".tr)),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildFrame(politicsText: "lbl_politics".tr)),
                  SizedBox(height: 10.v),
                  Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildFrame(politicsText: "lbl_politics".tr)),
                  SizedBox(height: 5.v)
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
        title: AppbarSubtitle(
            text: "lbl_fav_category".tr, margin: EdgeInsets.only(left: 106.h)));
  }

  /// Section Widget
  Widget _buildFrameNinetySix() {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v, bottom: 1.v),
              child:
                  Text("lbl_sports".tr, style: CustomTextStyles.titleSmall15)),
          CustomImageView(
              imagePath: ImageConstant.imgUilMinus,
              height: 24.adaptSize,
              width: 24.adaptSize)
        ]));
  }

  /// Common widget
  Widget _buildFrame({required String politicsText}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v, bottom: 3.v),
          child: Text(politicsText,
              style: CustomTextStyles.titleSmall15
                  .copyWith(color: appTheme.gray900))),
      CustomImageView(
          imagePath: ImageConstant.imgUilMinus,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
