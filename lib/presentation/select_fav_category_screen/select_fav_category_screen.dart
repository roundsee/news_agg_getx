import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:new_agg/presentation/select_fav_category_screen/model/categorychipitems_item_model.dart';
import 'package:new_agg/presentation/select_fav_category_screen/widget/categorychipitem_item_widget.dart';
import 'controller/select_fav_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SelectFavCategoryScreen extends GetWidget<SelectFavCategoryController> {
  SelectFavCategoryScreen({Key? key})
      : super(
          key: key,
        );

  SelectFavCategoryController selFavCatController =
      Get.put(SelectFavCategoryController());

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
            vertical: 35.v,
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
              SizedBox(height: 5.v),
              Text(
                "msg_pilih_5_kategori".tr,
                style: CustomTextStyles.bodyLargePoppinsPrimaryContainer,
              ),
              SizedBox(height: 10.v),
              //_buildCategoryChipItems(),
              //_buildCategoryGridItems(),
              _buildCategoryChipItems(),
              SizedBox(height: 20.v),
              _buildFrameTwentySeven(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCategoryChipItems() {
    //controller.GetCategoryChipsItems();
    return Obx(
      () => Wrap(
        runSpacing: 5.v,
        spacing: 5.h,
        children: List<Widget>.generate(
          selFavCatController.allChipsCategory.length,
          (index) {
            return _buildButtonCategory(
                selFavCatController.allChipsCategory[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryGridItems() {
    //controller.GetCategoryChipsItems();
    return Obx(
      () => ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: List.generate(
            selFavCatController
                .allChipsCategory.length, // .allNewsPerCategory.value.length,
            (index) {
          return _buildButtonCategory(
              selFavCatController.allChipsCategory[index]);
        }),
      ),
    );
  }

  Widget _buildButtonCategory(ChipsCategory chipItem) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            } else {
              return Colors.lightGreen;
            }
            //return null; // Use the component's default.
          },
        ),
      ),
      child: Text(chipItem.category.toString()),
    );
  }

  Widget _buildChipscategory(ChipsCategory chipItems) {
    return RawChip(
      /*
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 2.v,
      ),
      */
      //showCheckmark: false,
      //labelPadding: EdgeInsets.zero,
      label: Text(
        chipItems.category,
        style: TextStyle(
          color: (chipItems.selected) ? appTheme.whiteA700 : appTheme.green900,
          //fontSize: 12.fSize,
          //fontFamily: 'Inter',
          //fontWeight: FontWeight.w400,
        ),
      ),
      selected: (chipItems.selected),
      backgroundColor: appTheme.gray100,
      selectedColor: appTheme.green7007f,
      shape: (chipItems.selected)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                9.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                9.h,
              ),
            ),
      onPressed: () {
        //selFavCatController.selectCategory(chipItems.id);
      },
      onSelected: (value) {
        //chipItems.selected = !value;
      },
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
            InkWell(
              child: Text(
                "lbl_later".tr,
                style: CustomTextStyles.bodyLargeGray50001,
              ),
              onTap: () {
                //Get.to(AlternativeHomePageDesignContainerScreen());

                Get.toNamed(AppRoutes.alternativeHomePageDesignContainerScreen);
              },
            ),
            InkWell(
              child: Text(
                "lbl_next".tr,
                style: CustomTextStyles.bodyLargeOnError,
              ),
              onTap: () {
                selFavCatController.submitFavCategory();
              },
            ),
          ],
        ),
      ),
    );
  }
}
