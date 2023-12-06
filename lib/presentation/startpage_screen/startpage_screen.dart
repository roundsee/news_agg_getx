import 'controller/startpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartpageScreen extends GetWidget<StartpageController> {
  const StartpageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFrameSeventyEight(),
                      SizedBox(height: 20.v),
                      Container(
                          height: 8.v,
                          margin: EdgeInsets.only(left: 22.h),
                          child: AnimatedSmoothIndicator(
                              activeIndex: 0,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                  spacing: 5,
                                  activeDotColor: theme.colorScheme.onError,
                                  dotColor: appTheme.blueGray100,
                                  dotHeight: 8.v,
                                  dotWidth: 8.h))),
                      SizedBox(height: 20.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Text("msg_berita_aktual_setiap".tr,
                              style:
                                  CustomTextStyles.titleMediumKohSantepheap)),
                      SizedBox(height: 10.v),
                      Container(
                          width: 263.h,
                          margin: EdgeInsets.only(left: 22.h, right: 74.h),
                          child: Text("msg_apa_saja_yang_terjadi".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .labelMediumPoppinsBluegray400)),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildFrameEightyOne()));
  }

  /// Section Widget
  Widget _buildFrameSeventyEight() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 28.v),
        decoration: AppDecoration.fillBlack.copyWith(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgFrame78),
                fit: BoxFit.cover)),
        child: GestureDetector(
            onTap: () {
              onTapTxtSkip();
            },
            child: Text("lbl_skip".tr,
                style: CustomTextStyles.labelLargeWhiteA700)));
  }

  /// Section Widget
  Widget _buildFrameEightyOne() {
    return Padding(
        padding: EdgeInsets.only(left: 33.h, right: 33.h, bottom: 38.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomElevatedButton(
              height: 44.v,
              width: 135.h,
              text: "lbl_sign_in".tr,
              buttonStyle: CustomButtonStyles.outlineBlack,
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
              onPressed: () {
                onTapSignIn();
              }),
          CustomOutlinedButton(
              height: 44.v,
              width: 135.h,
              text: "lbl_sign_up".tr,
              margin: EdgeInsets.only(left: 23.h),
              buttonTextStyle: CustomTextStyles.titleMediumOnError,
              onPressed: () {
                onTapSignUp();
              })
        ]));
  }

  /// Navigates to the alternativeHomePageDesignContainerScreen when the action is triggered.
  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.alternativeHomePageDesignContainerScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapSignIn() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }

  /// Navigates to the registerPageScreen when the action is triggered.
  onTapSignUp() {
    Get.toNamed(
      AppRoutes.registerPageScreen,
    );
  }
}
