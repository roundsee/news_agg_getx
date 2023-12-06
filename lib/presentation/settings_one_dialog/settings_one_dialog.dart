import 'controller/settings_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class SettingsOneDialog extends StatelessWidget {
  SettingsOneDialog(this.controller, {Key? key}) : super(key: key);

  SettingsOneController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 235.h,
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 32.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("msg_apakah_anda_ingin".tr,
              style: CustomTextStyles.labelLargeSemiBold),
          SizedBox(height: 23.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomOutlinedButton(
                height: 25.v,
                width: 76.h,
                text: "lbl_tidak".tr,
                buttonTextStyle: CustomTextStyles.labelMediumPoppinsOnError,
                onPressed: () {
                  onTapTidak();
                }),
            CustomElevatedButton(
                height: 25.v,
                width: 76.h,
                text: "lbl_hapus".tr,
                margin: EdgeInsets.only(left: 10.h),
                buttonTextStyle: CustomTextStyles.labelMediumPoppinsWhiteA700,
                onPressed: () {
                  onTapHapus();
                })
          ]),
          SizedBox(height: 13.v)
        ]));
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapTidak() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapHapus() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
