import 'controller/bahasa_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';
import 'package:new_agg/widgets/custom_radio_button.dart';

class BahasaScreen extends GetWidget<BahasaController> {
  const BahasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgUkuranText),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Spacer(), _buildLanguageSelection()])))));
  }

  /// Section Widget
  Widget _buildLanguageSelection() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 19.v),
        decoration: AppDecoration.outlineBlack900
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_bahasa".tr,
                      style: CustomTextStyles.titleSmallBold)),
              SizedBox(height: 17.v),
              Obx(() => Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: CustomRadioButton(
                      text: "lbl_indonesia".tr,
                      value: "lbl_indonesia".tr,
                      groupValue: controller.radioGroup.value,
                      padding: EdgeInsets.symmetric(vertical: 3.v),
                      onChange: (value) {
                        controller.radioGroup.value = value;
                      }))),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgMdiRadioButtonUnchecked,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, top: 5.v),
                        child: Text("lbl_inggris".tr,
                            style: theme.textTheme.titleSmall))
                  ])),
              SizedBox(height: 87.v),
              Align(
                  alignment: Alignment.centerRight,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    CustomOutlinedButton(
                        width: 95.h,
                        text: "lbl_batal".tr,
                        onPressed: () {
                          onTapBatal();
                        }),
                    CustomElevatedButton(
                        width: 95.h,
                        text: "lbl_simpan".tr,
                        margin: EdgeInsets.only(left: 23.h),
                        onPressed: () {
                          onTapSimpan();
                        })
                  ])),
              SizedBox(height: 18.v)
            ]));
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapBatal() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapSimpan() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
