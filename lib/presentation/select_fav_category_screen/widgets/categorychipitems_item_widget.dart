import '../models/categorychipitems_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class CategorychipitemsItemWidget extends StatelessWidget {
  CategorychipitemsItemWidget(
    this.categorychipitemsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategorychipitemsItemModel categorychipitemsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 2.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          categorychipitemsItemModelObj.sport!.value,
          style: TextStyle(
            color: (categorychipitemsItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : appTheme.green900,
            fontSize: 12.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (categorychipitemsItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.green7007f,
        selectedColor: theme.colorScheme.onError,
        shape: (categorychipitemsItemModelObj.isSelected?.value ?? false)
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
        onSelected: (value) {
          categorychipitemsItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
