import '../controller/notification_controller.dart';
import '../models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(
    this.notificationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationItemModel notificationItemModelObj;

  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse8,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 2.v,
            bottom: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 179.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_cing_abdel".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: "msg_memberi_like_pada".tr,
                        style: CustomTextStyles.labelLargeMedium_1,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 1.v),
              Obx(
                () => Text(
                  notificationItemModelObj.menitCounter!.value,
                  style: CustomTextStyles.bodySmall9,
                ),
              ),
            ],
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgRectangle11,
          height: 48.v,
          width: 60.h,
          radius: BorderRadius.circular(
            10.h,
          ),
          margin: EdgeInsets.only(left: 8.h),
        ),
      ],
    );
  }
}
