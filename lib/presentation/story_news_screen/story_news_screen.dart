import 'controller/story_news_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';

class StoryNewsScreen extends GetWidget<StoryNewsController> {
  const StoryNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.black900.withOpacity(0.2),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.black900.withOpacity(0.2),
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgStoryNews),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.h, vertical: 49.v),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLineFiveRow(),
                          SizedBox(height: 11.v),
                          _buildArrowRightRow(),
                          SizedBox(height: 47.v),
                          Container(
                              width: 272.h,
                              margin: EdgeInsets.only(right: 37.h),
                              child: Text("msg_pbb_mengambil_keputusan".tr,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.headlineSmallWhiteA700
                                      .copyWith(height: 1.21))),
                          Spacer(),
                          Container(
                              width: 281.h,
                              margin: EdgeInsets.only(right: 28.h),
                              child: Text("msg_desakan_yang_kuat".tr,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .titleSmallPoppinsWhiteA700)),
                          SizedBox(height: 14.v),
                          CustomElevatedButton(
                              width: 143.h,
                              text: "msg_baca_selangkapnya".tr,
                              onPressed: () {
                                onTapBacaSelangkapnya();
                              }),
                          SizedBox(height: 21.v)
                        ])))));
  }

  /// Section Widget
  Widget _buildLineFiveRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(child: Divider(color: appTheme.whiteA700, endIndent: 6.h)),
      Expanded(
          child: Divider(
              color: appTheme.whiteA700.withOpacity(0.47),
              indent: 6.h,
              endIndent: 6.h)),
      Expanded(
          child:
              Divider(color: appTheme.whiteA700.withOpacity(0.47), indent: 6.h))
    ]);
  }

  /// Section Widget
  Widget _buildArrowRightRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomImageView(
          imagePath: ImageConstant.imgImage7, height: 24.v, width: 41.h),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRightWhiteA700,
          height: 24.adaptSize,
          width: 24.adaptSize)
    ]);
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapBacaSelangkapnya() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
