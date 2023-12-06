import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/fav_category_screen/models/fav_category_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the FavCategoryScreen.
///
/// This class manages the state of the FavCategoryScreen, including the
/// current favCategoryModelObj
class FavCategoryController extends GetxController {
  TextEditingController ionsearchcircleController = TextEditingController();

  Rx<FavCategoryModel> favCategoryModelObj = FavCategoryModel().obs;

  @override
  void onClose() {
    super.onClose();
    ionsearchcircleController.dispose();
  }
}
