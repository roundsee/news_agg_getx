import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/news_item_model.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/core/utils/pref_utils.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendedListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RecommendedListController();
  // for list view
  dynamic argumentData = Get.arguments;

  //RxList<Content> AllNewsPerCategory = <Content>[].obs;
  RxList<Content> allRecommended = (List<Content>.of([])).obs;

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxBool categoryNotFound = false.obs;
  RxBool isLoading = false.obs;
  var _listType =
      1; //1: new news, 2. recommended list, 3.trending list , 4: suggested
  var _arg = 1; //
  var _arg2 = 1; //

  @override
  void onInit() {
    if (argumentData == null) {
      _listType = 1;
      _arg = 10;
      _arg2 = 1;
    } else {
      _listType = argumentData[0]['id'];
      _arg = argumentData[0]['arg'];
      _arg2 = argumentData[0]['arg2'];
    }
    // Get All List  (1: New News, 2: Recommended , 3. Trending, 4. General News)
    getAllRecommendedList();

    //print(argumentData[0]['idcategory']);
    //getNewsPerCategories(argumentData[0]['idcategory']);
    //print(argumentData[1]['second']);
    super.onInit();
  }

  getAllRecommendedList() async {
    //Creates a new Uri object by parsing a URI string.

    //final SharedPreferences prefs = await SharedPreferences.getInstance();

    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";
    var headers = getHeaders("req");
    /*
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };
    */
    var _endPoint = "";

    switch (_listType) {
      case 1:
        // New News : contents/categories/2
        _endPoint = ApiEndPoints.contentEndpoints.CategoryContent +
            "/" +
            _arg.toString();
        break;
      case 2:
        // recommended : api/contents/recommendation/3/1
        _endPoint = ApiEndPoints.contentEndpoints.RecommendedContent +
            "/" +
            _arg.toString() +
            "/" +
            _arg2.toString();
        break;
      case 3:
        // Trend
        _endPoint = ApiEndPoints.contentEndpoints.TrendingContent +
            "/" +
            _arg.toString() +
            "/" +
            _arg2.toString();
        break;
      case 4:
        // suggested
        _endPoint = ApiEndPoints.contentEndpoints.SuggestedContent +
            "/" +
            _arg.toString() +
            "/" +
            _arg2.toString();
        break;
    }

    var url = Uri.parse(ApiEndPoints.baseUrl + _endPoint);

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }

    if (res.statusCode == 200) {
      allRecommended?.clear();
      //Parses the string and returns the resulting Json object.
      ContentPerCategory contentCategoryData =
          ContentPerCategory.fromJson(jsonDecode(res.body));

      for (int i = 0; i < contentCategoryData.data!.length; i++) {
        Content content = new Content();
        content.category = contentCategoryData.data![i].content!.category;
        content.description = contentCategoryData.data![i].content!.category;
        content.header = contentCategoryData.data![i].content!.header;
        content.id = contentCategoryData.data![i].content!.id;
        content.interaction = contentCategoryData.data![i].content!.interaction;
        content.statistics = contentCategoryData.data![i].content!.statistics;
        content.publish = contentCategoryData.data![i].content!.publish;
        content.slug = contentCategoryData.data![i].content!.slug;
        content.source = contentCategoryData.data![i].content!.source;
        content.title = contentCategoryData.data![i].content!.title;

        allRecommended!.add(content);
      }
      print(allRecommended);
      allRecommended?.refresh();
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }
}
