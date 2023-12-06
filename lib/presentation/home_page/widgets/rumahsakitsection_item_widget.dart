import '../controller/home_controller.dart';
import '../models/rumahsakitsection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class RumahsakitsectionItemWidget extends StatelessWidget {
  RumahsakitsectionItemWidget(
    this.rumahsakitsectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RumahsakitsectionItemModel rumahsakitsectionItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrame85,
            height: 69.v,
            width: 73.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 7.v,
              bottom: 11.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.h,
                  child: Obx(
                    () => Text(
                      rumahsakitsectionItemModelObj.rumahSakitDiGaza!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeGray900,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Obx(
                  () => Text(
                    rumahsakitsectionItemModelObj.oktober!.value,
                    style: CustomTextStyles.bodySmallGray70007,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
