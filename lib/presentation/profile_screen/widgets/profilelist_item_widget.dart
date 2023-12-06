import '../controller/profile_controller.dart';
import '../models/profilelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class ProfilelistItemWidget extends StatelessWidget {
  ProfilelistItemWidget(
    this.profilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfilelistItemModel profilelistItemModelObj;

  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillOnError.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Obx(
              () => Text(
                profilelistItemModelObj.beritaYangDisukai!.value,
                style: CustomTextStyles.titleSmallWhiteA700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 17.h),
            child: Obx(
              () => Text(
                profilelistItemModelObj.threeHundredFiftyFive!.value,
                style: CustomTextStyles.titleSmallWhiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
