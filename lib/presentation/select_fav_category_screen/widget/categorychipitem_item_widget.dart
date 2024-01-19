import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/presentation/select_fav_category_screen/controller/select_fav_category_controller.dart';
import 'package:new_agg/presentation/select_fav_category_screen/model/categorychipitems_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class CategorychipitemsItemWidget extends StatelessWidget {
  CategorychipitemsItemWidget(
    this.chipItems, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipsCategory chipItems;
  // SelectFavCategoryController chipsController =
  //     Get.put(SelectFavCategoryController());

  //final chipsController = Get.find<SelectFavCategoryController>();
//SelectFavCategoryController selFavCatController =       Get.put(SelectFavCategoryController());
  @override
  Widget build(BuildContext context) {
    //   return Obx(
    //     () =>
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 2.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipItems.category!,
        style: TextStyle(
          color: (chipItems.selected) ? appTheme.whiteA700 : appTheme.green900,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
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
        // chipsController.selectCategory(chipItems.id);
      },
      onSelected: (value) {
        chipItems.selected = !value;
      },
    );
    //);
  }
}
