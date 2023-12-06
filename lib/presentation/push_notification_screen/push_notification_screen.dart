import 'controller/push_notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class PushNotificationScreen extends GetWidget<PushNotificationController> {
  const PushNotificationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.whiteA700.withOpacity(0.32),
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: appTheme.whiteA700.withOpacity(0.32),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgPushNotification,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 23.h,
              top: 96.v,
              right: 23.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "lbl_17_33".tr,
                  style: theme.textTheme.displayLarge,
                ),
                Text(
                  "lbl_rab_25_okt".tr,
                  style: CustomTextStyles.bodySmallWhiteA70011,
                ),
                SizedBox(height: 34.v),
                _buildPushNotificationLogoTwo(),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPushNotificationLogoTwo() {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(vertical: 6.v),
      decoration: AppDecoration.fillWhiteA7001,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogo2,
                      height: 18.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 4.h,
                        top: 4.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "lbl_sekarang".tr,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_trending_news".tr,
                  style: theme.textTheme.labelSmall,
                ),
                SizedBox(height: 6.v),
                Text(
                  "msg_pemerintah_berharap".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle12,
            height: 55.adaptSize,
            width: 55.adaptSize,
            radius: BorderRadius.circular(
              10.h,
            ),
            margin: EdgeInsets.only(top: 6.v),
          ),
        ],
      ),
    );
  }
}
