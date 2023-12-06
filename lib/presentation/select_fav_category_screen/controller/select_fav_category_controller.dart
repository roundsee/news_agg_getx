import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/select_fav_category_screen/models/category_model.dart';
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
  TextEditingController ionsearchcircleController = TextEditingController();

  Rx<SelectFavCategoryModel> selectFavCategoryModelObj =
      SelectFavCategoryModel().obs;

  var category = <Category>[].obs;
  var selectedCategory = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onClose() {
    super.onClose();
    ionsearchcircleController.dispose();
  }

  void onInit() {
    super.onInit();
    fetchCategory();
  }

  Category? categoryModel;
  fetchCategory() async {
    try {
      isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs!.getString('token').toString();

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
        'User-Agent': 'LENOVO ideapad 3'
      };

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.categories);
      Map body = {};
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        categoryModel = Category.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
