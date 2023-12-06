import '../controller/search_page_controller.dart';
import '../models/searchpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class SearchpageItemWidget extends StatelessWidget {
  SearchpageItemWidget(
    this.searchpageItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SearchpageItemModel searchpageItemModelObj;

  var controller = Get.find<SearchPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.h),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 7.h,
              top: 13.v,
              bottom: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.h,
                  child: Obx(
                    () => Text(
                      searchpageItemModelObj.rumahSakitDiGaza!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeGray900,
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                Obx(
                  () => Text(
                    searchpageItemModelObj.oktober!.value,
                    style: CustomTextStyles.bodySmallGray70007,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: searchpageItemModelObj.image!.value,
              height: 69.v,
              width: 73.h,
              radius: BorderRadius.circular(
                10.h,
              ),
              margin: EdgeInsets.only(top: 1.v),
            ),
          ),
        ],
      ),
    );
  }
}
