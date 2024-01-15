import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/select_fav_category_screen/model/select_fav_category_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SelectFavCategoryScreen.
///
/// This class manages the state of the SelectFavCategoryScreen, including the
/// current selectFavCategoryModelObj
class SelectFavCategoryController extends GetxController {
  TextEditingController ionsearchcircleController = TextEditingController();

  Rx<SelectFavCategoryModel> selectFavCategoryModelObj =
      SelectFavCategoryModel().obs;

  @override
  void onClose() {
    super.onClose();
    ionsearchcircleController.dispose();
  }
}
