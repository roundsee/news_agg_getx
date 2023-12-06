import '../controller/home_controller.dart';
import '../models/ninetyfoursection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class NinetyfoursectionItemWidget extends StatelessWidget {
  NinetyfoursectionItemWidget(
    this.ninetyfoursectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NinetyfoursectionItemModel ninetyfoursectionItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 10.v,
      ),
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
                          ninetyfoursectionItemModelObj.politik!.value,
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
                            ImageConstant.imgFrame41,
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
                                ninetyfoursectionItemModelObj.politik1!.value,
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
          Obx(
            () => Text(
              ninetyfoursectionItemModelObj.britaniaRayaResmi!.value,
              style: theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 9.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 201.h,
              child: Obx(
                () => Text(
                  ninetyfoursectionItemModelObj.description!.value,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
          SizedBox(height: 7.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 21.v),
                child: Obx(
                  () => Text(
                    ninetyfoursectionItemModelObj.jamYangLalu!.value,
                    style: CustomTextStyles.bodySmallGray600,
                  ),
                ),
              ),
              Spacer(),
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
                      ninetyfoursectionItemModelObj.oneHundred!.value,
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
                      imagePath: ImageConstant.imgPhBookmarkSimpleFill,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    SizedBox(height: 3.v),
                    Obx(
                      () => Text(
                        ninetyfoursectionItemModelObj.oneHundred1!.value,
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
                      imagePath: ImageConstant.imgMajesticonsShareCircle,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    SizedBox(height: 3.v),
                    Obx(
                      () => Text(
                        ninetyfoursectionItemModelObj.oneHundred2!.value,
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
    );
  }
}
