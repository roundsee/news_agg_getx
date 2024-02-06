import '../notification_screen/widgets/notification_item_widget.dart';
import 'controller/notification_controller.dart';
import 'models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 25.h, top: 10.v, right: 25.h),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 26.v);
                    },
                    itemCount: controller.notificationModelObj.value
                        .notificationItemList.value.length,
                    itemBuilder: (context, index) {
                      NotificationItemModel model = controller
                          .notificationModelObj
                          .value
                          .notificationItemList
                          .value[index];
                      return NotificationItemWidget(model);
                    })))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 77.v,
        leadingWidth: 49.h,
        leading: AppBar(
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          ),
        ),

        //AppbarLeadingImage(
        //    imagePath: ImageConstant.imgArrowLeft,
        //    margin: EdgeInsets.only(left: 25.h, top: 16.v, bottom: 16.v),
        //    onTap: () {
        //      onTapArrowLeft();
        //    }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_notifikasi".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
