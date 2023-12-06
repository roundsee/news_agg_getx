import '../select_fav_category_screen/widgets/categorychipitems_item_widget.dart';
import 'controller/select_fav_category_controller.dart';
import 'models/categorychipitems_item_model.dart';
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
              SizedBox(height: 15.v),
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
