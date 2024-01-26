import 'package:new_agg/core/models/suggestion_model.dart';
import 'package:new_agg/core/models/suggestion_model_show.dart';

import '../controller/news_one_controller.dart';
import '../models/newsonelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class NewsonelistItemWidget extends StatelessWidget {
  NewsonelistItemWidget(
    this.suggestionContent, {
    Key? key,
  }) : super(
          key: key,
        );

  SuggestionModel suggestionContent;

  var controller = Get.find<NewsOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: 311.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 139.v,
              bottom: 5.v,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSolarHeartBold,
                    height: 10.adaptSize,
                    width: 20.adaptSize,
                  ),
                  SizedBox(height: 2.v),
                  Obx(
                    () => Text(
                      suggestionContent.like.toString(),
                      //suggestionContent.oneHundred!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 139.v,
              bottom: 7.v,
            ),
            child: SingleChildScrollView(
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
                      suggestionContent.save.toString(),

                      //suggestionContent.oneHundred!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 139.v,
              bottom: 7.v,
            ),
            child: SingleChildScrollView(
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
                      suggestionContent.share.toString(),
                      //suggestionContent.oneHundred!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 3.h,
                bottom: 7.v,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        decoration:
                            AppDecoration.fillOnPrimaryContainer.copyWith(
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
                                decoration:
                                    AppDecoration.fillGray700021.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5,
                                ),
                                child: Obx(
                                  () => Text(
                                    suggestionContent.title.toString(),
                                    style:
                                        CustomTextStyles.bodySmallWhiteA700_1,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(5.h),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder5,
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
                                    SizedBox(height: 25.v),
                                    Container(
                                      width: 33.h,
                                      padding: EdgeInsets.all(5.h),
                                      decoration:
                                          AppDecoration.fillGray70002.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5,
                                      ),
                                      child: Obx(
                                        () => Text(
                                          suggestionContent.category.toString(),
                                          style: CustomTextStyles
                                              .bodySmallWhiteA700_1,
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
                      margin: EdgeInsets.only(right: 290.h),
                      child: Obx(
                        () => Text(
                          suggestionContent.title.toString(),
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.v),
                    SizedBox(
                      width: 201.h,
                      child: Obx(
                        () => Text(
                          suggestionContent.title.toString(),
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Obx(
                      () => Text(
                        suggestionContent.header.toString(),
                        style: CustomTextStyles.bodySmallGray600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
