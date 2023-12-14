import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:new_agg/presentation/select_fav_category_screen/models/category_model.dart';
import 'package:new_agg/core/service/CategoryService.dart';
import 'package:new_agg/presentation/select_fav_category_screen/models/categorychipitems_item_model.dart';
import 'package:new_agg/presentation/select_fav_category_screen/models/select_fav_category_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the SelectFavCategoryScreen.
///
/// This class manages the state of the SelectFavCategoryScreen, including the
/// current selectFavCategoryModelObj
class SelectFavCategoryController extends GetxController {
  String SelectedCategory = "";
  TextEditingController ionsearchcircleController = TextEditingController();

  Rx<SelectFavCategoryModel> selectFavCategoryModelObj =
      SelectFavCategoryModel().obs;

  Rx<SelectFavCategoryModel> selectFavCategoryModelxx =
      SelectFavCategoryModel().obs;

  var categorychipitemsItemList = CategoryService().fetchDataCategory();

  var category = <Category>[].obs;
  var selectedCategory = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onClose() {
    super.onClose();
    ionsearchcircleController.dispose();
  }

  SaveFav() {
    var Result = CategoryService().SaveFavCategory(selectedCategory.toString());
    if (Result == 1) {
      // goto Home
    } else {
      // Error saving
    }
  }
}
