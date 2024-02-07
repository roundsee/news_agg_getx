import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// A controller class for the SelectFavCategoryScreen.
///
/// This class manages the state of the SelectFavCategoryScreen, including the
/// current selectFavCategoryModelObj
class SelectFavCategoryController extends GetxController {
  // TextEditingController ionsearchcircleController = TextEditingController();
  dynamic argumentData = Get.arguments;
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
    if (argumentData == null) {
      GetCategoryChipsItems(false);
    } else {
      GetCategoryChipsItems(true);
    }

    //GetCategoryChipsItems();
    super.onInit();
  }

  GetCategoryChipsItems(bool isNew) async {
    //Creates a new Uri object by parsing a URI string.

    var headers = getHeaders("req");
    if (isNew) {}
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

  bool categorySelected(int idcategory) {
    final index =
        allChipsCategory.indexWhere((element) => element.id == idcategory);
    return allChipsCategory[index].selected;
  }

  selectCategory(int idcategory) {
    final index =
        allChipsCategory.indexWhere((element) => element.id == idcategory);
    if (index >= 0) {
      allChipsCategory[index].selected = !allChipsCategory[index].selected;
      allChipsCategory.refresh();
    }
  }

  submitFavCategory() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    //var _pref = new PrefUtils();
    //var token = _pref.getUserToken();
    var strCategory = "";
    for (int i = 0; i < allChipsCategory.length; i++) {
      if (allChipsCategory[i].selected) {
        if (strCategory == "") {
          strCategory = allChipsCategory[i].id.toString();
        } else {
          strCategory = strCategory + "," + allChipsCategory[i].id.toString();
        }
      }
    }

    var headers = getHeaders("req");
//"Authorization" -> "1706666101_Bh0RIIc7Na7j6acJsYNPpRAua8WxZtjpaPA7uqsz_83312963-44ef-42f2-86c5-cd8c21067bd5"
//1705057042_a6k9qy1aFiddJRJ441pXdf2VwgUXuGdtd25TIvDA_83312963-44ef-42f2-86c5-cd8c21067bd5
    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.categoryEndpoints.saveFavouriteCategory);
    Map body = {"id_category": strCategory};
    var strbody = jsonEncode(body);
    http.Response res = await http.post(url, headers: headers, body: strbody);
    var resp = jsonDecode(res.body);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 201) {
      Get.snackbar(
        "Favourite Category",
        "Congratulation, Your Favourite Categories are saved ",
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(AlternativeHomePageDesignContainerScreen());
    } else {
      Get.snackbar(
        "Favourite Category",
        resp['message'],
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
