import '../controller/alternative_home_page_design_one_controller.dart';
import '../models/alternativehomepagedesignonegrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class AlternativehomepagedesignonegridItemWidget extends StatelessWidget {
  AlternativehomepagedesignonegridItemWidget(
    this.alternativehomepagedesignonegridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AlternativehomepagedesignonegridItemModel
      alternativehomepagedesignonegridItemModelObj;

  var controller = Get.find<AlternativeHomePageDesignOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: theme.colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Container(
              height: 75.v,
              width: 287.h,
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 8.v,
                        right: 6.h,
                      ),
                      padding: EdgeInsets.all(5.h),
                      decoration: AppDecoration.fillGray700021.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Obx(
                        () => Text(
                          alternativehomepagedesignonegridItemModelObj
                              .politik!.value,
                          style: CustomTextStyles.bodySmallWhiteA700_1,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                        image: DecorationImage(
                          image: AssetImage(
                            ImageConstant.imgFrame4175x287,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 35.v),
                          Container(
                            width: 33.h,
                            padding: EdgeInsets.all(5.h),
                            decoration: AppDecoration.fillGray70002.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Obx(
                              () => Text(
                                alternativehomepagedesignonegridItemModelObj
                                    .politik1!.value,
                                style: CustomTextStyles.bodySmallWhiteA700_1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            width: 287.h,
            margin: EdgeInsets.symmetric(horizontal: 12.h),
            child: Obx(
              () => Text(
                alternativehomepagedesignonegridItemModelObj
                    .keputusanPrabowo!.value,
                maxLines: null,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(height: 4.v),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 53.v,
              width: 278.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSolarHeartBold,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            SizedBox(height: 3.v),
                            Obx(
                              () => Text(
                                alternativehomepagedesignonegridItemModelObj
                                    .oneHundred!.value,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgPhBookmarkSimpleFill,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              SizedBox(height: 3.v),
                              Obx(
                                () => Text(
                                  alternativehomepagedesignonegridItemModelObj
                                      .oneHundred1!.value,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgMajesticonsShareCircle,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                              SizedBox(height: 3.v),
                              Obx(
                                () => Text(
                                  alternativehomepagedesignonegridItemModelObj
                                      .oneHundred2!.value,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 201.h,
                          child: Obx(
                            () => Text(
                              alternativehomepagedesignonegridItemModelObj
                                  .description!.value,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ),
                        SizedBox(height: 11.v),
                        Obx(
                          () => Text(
                            alternativehomepagedesignonegridItemModelObj
                                .jamYangLalu!.value,
                            style: CustomTextStyles.bodySmallGray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}
