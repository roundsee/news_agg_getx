import '../controller/filter_search_controller.dart';
import '../models/filtersearchlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore: must_be_immutable
class FiltersearchlistItemWidget extends StatelessWidget {
  FiltersearchlistItemWidget(
    this.filtersearchlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FiltersearchlistItemModel filtersearchlistItemModelObj;

  var controller = Get.find<FilterSearchController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => CustomImageView(
            imagePath: filtersearchlistItemModelObj.politics!.value,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 3.v,
            bottom: 3.v,
          ),
          child: Obx(
            () => Text(
              filtersearchlistItemModelObj.politics1!.value,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
