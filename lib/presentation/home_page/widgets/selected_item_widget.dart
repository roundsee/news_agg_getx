import '../controller/home_controller.dart';
import '../models/selectednews_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class SelectedNewsItemWidget extends StatelessWidget {
  SelectedNewsItemWidget(
    this.selectedNewsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SelectedNewsItemModel selectedNewsItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(1),
              color: theme.colorScheme.onPrimaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Container(
                height: 160.v,
                width: 287.h,
                decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.all(30.h),
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
                                SizedBox(height: 27.v),
                                Container(
                                  width: 30.h,
                                  padding: EdgeInsets.all(5.h),
                                  decoration:
                                      AppDecoration.fillGray70002.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 8.v,
                              right: 6.h,
                            ),
                            padding: EdgeInsets.all(5.h),
                            decoration: AppDecoration.fillIndigo.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Obx(
                              () => Text(
                                selectedNewsItemModelObj.category!.value,
                                style: CustomTextStyles.bodySmallWhiteA700_1,
                              ),
                            ),
                          ),
                        ),
                        //TITLE ========
                        SizedBox(height: 4.v),
                        Container(
                          width: 287.h,
                          margin: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Obx(
                            () => Text(
                              selectedNewsItemModelObj.title!.value,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.v),
                    Row(
                      children: [
                        Column(
                          children: [
                            // LIKE ==============
                            CustomImageView(
                              imagePath: ImageConstant.imgSolarHeartBold,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                            SizedBox(height: 3.v),
                            Obx(
                              () => Text(
                                selectedNewsItemModelObj.jLike!.value,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        // SAVE  ==============
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
                                  selectedNewsItemModelObj.jSave!.value,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SHARE  ==============
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
                                  selectedNewsItemModelObj.jShare!.value,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.v),

            //LIKE SAVE SHARE
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
                                selectedNewsItemModelObj.description!.value,
                                maxLines: null,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),
                          SizedBox(height: 11.v),
                          Obx(
                            () => Text(
                              selectedNewsItemModelObj.publish!.value,
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
      ),
    );
  }
}
