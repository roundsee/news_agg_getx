import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/news_item_model.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsPerCategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  NewsPerCategoryController();
  // for list view
  dynamic argumentData = Get.arguments;
  //RxList<Content> AllNewsPerCategory = <Content>[].obs;
  RxList<Content> allNewsPerCategory = (List<Content>.of([])).obs;

  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxBool categoryNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    if (argumentData == null) {
    } else {
      getNewsPerCategories(argumentData[0]['idcategory']);
    }

    //print(argumentData[0]['idcategory']);
    //getNewsPerCategories(argumentData[0]['idcategory']);
    //print(argumentData[1]['second']);
    super.onInit();
  }

  getNewsPerCategories(var categoryId) async {
    //Creates a new Uri object by parsing a URI string.

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token').toString();
    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };
    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.contentEndpoints.CategoryContent +
        "/" +
        categoryId.toString());
    Map body = {
      'token': token,
    };

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    allNewsPerCategory.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      ContentPerCategory newsPerCategories =
          ContentPerCategory.fromJson(jsonDecode(res.body));

      for (int i = 0; i < newsPerCategories.data!.length; i++) {
        Content newsContent = new Content();
        newsContent.id = newsPerCategories.data![i].content?.id;
        newsContent.category = newsPerCategories.data![i].content?.category;
        newsContent.header = newsPerCategories.data![i].content?.header;
        newsContent.description =
            newsPerCategories.data![i].content?.description;
        newsContent.slug = newsPerCategories.data![i].content?.slug;
        newsContent.publish = newsPerCategories.data![i].content?.publish;
        newsContent.interaction =
            newsPerCategories.data![i].content?.interaction;
        newsContent.statistics = newsPerCategories.data![i].content?.statistics;
        newsContent.source = newsPerCategories.data![i].content?.source;
        newsContent.title = newsPerCategories.data![i].content?.title;

        allNewsPerCategory!.add(newsContent);
      }
      print(allNewsPerCategory);
      allNewsPerCategory.refresh();
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }
}
