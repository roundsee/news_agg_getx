import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/routes/app_routes.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class CategoriesController extends GetxController {
  // for list view
  List<Category> allCategory = <Category>[].obs;
  List<ChipsCategory> allChipsCategory = <ChipsCategory>[].obs;
  // for carousel

  ScrollController scrollController = ScrollController();
  RxBool categoryNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    //Creates a new Uri object by parsing a URI string.

    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //var token = prefs!.getString('token').toString();
    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";
    var headers = getHeaders("req");
    /*
    {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };
    */

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.categoryEndpoints.categories);

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      Categories categories = Categories.fromJson(jsonDecode(res.body));
      var imageUrl = "";
      for (int i = 0; i < categories.data!.length; i++) {
        Category category = new Category();
        category.id = categories.data![i].id!;
        imageUrl = categories.data![i].icon!;
        print("categories_controller");
        //if (!Uri.tryParse(imageUrl)!.isAbsolute) {
        //  category.icon =
        //      "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        //} else {
        if (await isValidUrl(imageUrl!)) {
          category.icon = imageUrl;
        } else {
          category.icon =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        }
        //}
        // category.icon = categories.data![i].icon!;
        category.category = categories.data![i].category!;
        allCategory!.add(category);
        /*
        ChipsCategory chipscategory = new ChipsCategory();
        chipscategory.id = categories.data![i].id!;
        chipscategory.icon = categories.data![i].icon!;
        chipscategory.category = categories.data![i].category!;
        chipscategory.selected = false;
        allChipsCategory!.add(chipscategory);
*/
      }

      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }
}
