import '../filter_search_screen/widgets/filtersearchlist_item_widget.dart';
import 'controller/filter_search_controller.dart';
import 'models/filtersearchlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';

class FilterSearchScreen extends GetWidget<FilterSearchController> {
  const FilterSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgFilterSearch),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Spacer(),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 45.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_kategori".tr,
                                        style: CustomTextStyles.titleSmallBold),
                                    SizedBox(height: 16.v),
                                    _buildFilterSearchList(),
                                    Spacer(),
                                    SizedBox(height: 6.v),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomOutlinedButton(
                                                  width: 95.h,
                                                  text: "lbl_batal".tr,
                                                  onPressed: () {
                                                    onTapBatal();
                                                  }),
                                              CustomElevatedButton(
                                                  width: 95.h,
                                                  text: "lbl_simpan".tr,
                                                  margin: EdgeInsets.only(
                                                      left: 23.h),
                                                  onPressed: () {
                                                    onTapSimpan();
                                                  })
                                            ]))
                                  ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildFilterSearchList() {
    return Padding(
        padding: EdgeInsets.only(right: 191.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 11.v);
            },
            itemCount: controller.filterSearchModelObj.value
                .filtersearchlistItemList.value.length,
            itemBuilder: (context, index) {
              FiltersearchlistItemModel model = controller.filterSearchModelObj
                  .value.filtersearchlistItemList.value[index];
              return FiltersearchlistItemWidget(model);
            })));
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapBatal() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapSimpan() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
