import 'package:new_agg/presentation/select_fav_category_screen/model/categorychipitems_item_model.dart';
import 'package:new_agg/presentation/select_fav_category_screen/widget/categorychipitem_item_widget.dart';
import 'controller/select_fav_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SelectFavCategoryScreen extends GetWidget<SelectFavCategoryController> {
  const SelectFavCategoryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 47.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 166.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_hai_idris".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: "msg_kamu_suka_baca_berita".tr,
                        style: CustomTextStyles.headlineSmallGray900,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 14.v),
              Text(
                "msg_pilih_5_kategori".tr,
                style: CustomTextStyles.bodyLargePoppinsPrimaryContainer,
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(right: 9.h),
                child: CustomTextFormField(
                  controller: controller.ionsearchcircleController,
                  hintText: "lbl_bisnis".tr,
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                    margin: EdgeInsets.all(10.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIonsearchcircle,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: 44.v,
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 13.v,
                    right: 30.h,
                    bottom: 13.v,
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    right: 19.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_bisnis".tr,
                        style: CustomTextStyles.bodyMediumPoppinsGray900,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgTypcnPlus,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.v),
              _buildCategoryChipItems(),
              SizedBox(height: 55.v),
              _buildFrameTwentySeven(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategoryChipItems() {
    return Obx(
      () => Wrap(
        runSpacing: 14.v,
        spacing: 14.h,
        children: List<Widget>.generate(
          controller.selectFavCategoryModelObj.value.categorychipitemsItemList
              .value.length,
          (index) {
            CategorychipitemsItemModel model = controller
                .selectFavCategoryModelObj
                .value
                .categorychipitemsItemList
                .value[index];

            return CategorychipitemsItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameTwentySeven() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "lbl_later".tr,
              style: CustomTextStyles.bodyLargeGray50001,
            ),
            Text(
              "lbl_next".tr,
              style: CustomTextStyles.bodyLargeOnError,
            ),
          ],
        ),
      ),
    );
  }
}
