import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'categorychipitems_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [select_fav_category_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectFavCategoryModel {
  Rx<List<CategorychipitemsItemModel>> categorychipitemsItemList = Rx(List.generate(18, (index) => CategorychipitemsItemModel()));
}      

class FavCategoryModel {
  Rx<List<CategorychipitemsItemModel>> categorychipitemsItemList = Rx(List.generate(18, (index) => CategorychipitemsItemModel()));
}