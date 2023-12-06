import '../search_page_screen/widgets/searchpage_item_widget.dart';
import 'controller/search_page_controller.dart';
import 'models/searchpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_searchview.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';

class SearchPageScreen extends GetWidget<SearchPageController> {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 20.v, right: 24.h),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.v);
                    },
                    itemCount: controller.searchPageModelObj.value
                        .searchpageItemList.value.length,
                    itemBuilder: (context, index) {
                      SearchpageItemModel model = controller.searchPageModelObj
                          .value.searchpageItemList.value[index];
                      return SearchpageItemWidget(model);
                    })))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 80.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 11.h),
            hintText: "lbl_search".tr,
            controller: controller.searchController));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
