import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:new_agg/presentation/select_fav_category_screen/model/select_fav_category_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// A controller class for the SelectFavCategoryScreen.
///
/// This class manages the state of the SelectFavCategoryScreen, including the
/// current selectFavCategoryModelObj
class SelectFavCategoryController extends GetxController {
  // TextEditingController ionsearchcircleController = TextEditingController();

  //Rx<SelectFavCategoryModel> selectFavCategoryModelObj = SelectFavCategoryModel().obs;
  RxList<ChipsCategory> allChipsCategory = <ChipsCategory>[].obs;
  Rx<String> selectedCategory = "".obs;
//categorychipitemsItemList
  @override
  void onClose() {
    super.onClose();
    // ionsearchcircleController.dispose();
  }

  void onInit() {
    GetCategoryChipsItems();
    super.onInit();
  }

  GetCategoryChipsItems() async {
    //Creates a new Uri object by parsing a URI string.

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    var _pref = new PrefUtils();
    var token = _pref.getUserToken();
    // prefs!.getString('token').toString();
    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.categoryEndpoints.categories);
    Map body = {
      'token': token,
    };

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      Categories categories = Categories.fromJson(jsonDecode(res.body));

      for (int i = 0; i < categories.data!.length; i++) {
        ChipsCategory chipscategory = new ChipsCategory();
        chipscategory.id = categories.data![i].id!;
        chipscategory.icon = categories.data![i].icon!;
        chipscategory.category = categories.data![i].category!;
        chipscategory.selected = false;
        allChipsCategory.add(chipscategory);
      }
      Logger.log(allChipsCategory);
    }
  }

  selectCategory(int idcategory) {
    final index =
        allChipsCategory.indexWhere((element) => element.id == idcategory);
    if (index >= 0) {
      allChipsCategory[index].selected = !allChipsCategory[index].selected;
    }
  }

  submitFavCategory() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    var _pref = new PrefUtils();
    var token = _pref.getUserToken();
    var strCategory;
    for (int i = 0; i < allChipsCategory.length; i++) {
      if (allChipsCategory[i].selected) {
        if (strCategory == "") {
          strCategory = allChipsCategory[i].id.toString();
        } else {
          strCategory = strCategory + "," + allChipsCategory[i].id.toString();
        }
      }
    }

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.categoryEndpoints.readersCategory);
    Map body = {"id_category": strCategory};

    http.Response res = await http.post(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      Get.snackbar(
        "Favourite Category",
        "Congratulation, Your Favourite Categories are saved ",
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(AlternativeHomePageDesignContainerScreen());
    }
  }
}
