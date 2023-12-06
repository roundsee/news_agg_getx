import '../controller/trending_controller.dart';
import '../models/trendingpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class TrendingpageItemWidget extends StatelessWidget {
  TrendingpageItemWidget(
    this.trendingpageItemModelObj, {
    Key? key,
    this.onTapCardNews,
  }) : super(
          key: key,
        );

  TrendingpageItemModel trendingpageItemModelObj;

  var controller = Get.find<TrendingController>();

  VoidCallback? onTapCardNews;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCardNews!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 10.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 287.h,
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 8.v,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder5,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgFrame40,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 39.v),
                  Container(
                    width: 33.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillGray70002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Obx(
                      () => Text(
                        trendingpageItemModelObj.politik!.value,
                        style: CustomTextStyles.bodySmallWhiteA700_1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 242.h,
                margin: EdgeInsets.only(right: 46.h),
                child: Obx(
                  () => Text(
                    trendingpageItemModelObj.elonMuskMemaksa!.value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 179.h,
                      child: Obx(
                        () => Text(
                          trendingpageItemModelObj.aksiBoykotMasal!.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Obx(
                      () => Text(
                        trendingpageItemModelObj.jamYangLalu!.value,
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 27.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgSolarHeartBold,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
                      Obx(
                        () => Text(
                          trendingpageItemModelObj.oneHundred!.value,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgPhBookmarkSimpleFill,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
                      Obx(
                        () => Text(
                          trendingpageItemModelObj.oneHundred1!.value,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMajesticonsShareCircle,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
                      Obx(
                        () => Text(
                          trendingpageItemModelObj.oneHundred2!.value,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.v),
          ],
        ),
      ),
    );
  }
}
