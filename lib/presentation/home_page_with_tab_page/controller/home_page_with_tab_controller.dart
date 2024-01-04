import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:new_agg/core/models/category.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/trending.dart';
//import 'package:new_agg/presentation/home_page/models/news_per_category.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/models/home_page_with_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
//import 'dart:html';

/// A controller class for the HomePageWithTabPage.
///
/// This class manages the state of the HomePageWithTabPage, including the
/// current homePageWithTabModelObj
class HomePageWithTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomePageWithTabController(this.homePageWithTabModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<HomePageWithTabModel> homePageWithTabModelObj;
  RxList<Content>? listContent = <Content>[].obs;
  List<Category>? listCategory = <Category>[].obs;
  List<Trend>? listTrend = <Trend>[].obs;
  RxList<Content>? listRecommended = <Content>[].obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));
  RxBool categoryNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllContentCategoryFromApi();
    getAllCategoriesFromApi();
    getAllRecommendedFromApi();

    super.onInit();
  }

  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  getAllContentCategoryFromApi() async {
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
    if (searchController.text.toString() == null) {
    } else {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.contentEndpoints.CategoryContent +
          "/1");
    }
    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.contentEndpoints.CategoryContent +
        "/1");
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
      listContent?.clear();
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

        listContent!.add(content);
      }
      print(listContent);
      listContent?.refresh();
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }

  getAllCategoriesFromApi() async {
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
        Category category = new Category();
        category.id = categories.data![i].id!;
        category.icon = categories.data![i].icon!;
        category.category = categories.data![i].category!;

        listCategory!.add(category);
      }
      print(listCategory);
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }

  getTendingsFromApi() async {
    //Creates a new Uri object by parsing a URI string.

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token').toString();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'id',
      'User-Agent': 'LENOVO ideapad 3'
    };
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.TrendingContent);
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
      Trending trending = Trending.fromJson(jsonDecode(res.body));

      for (int i = 0; i < trending.data!.length; i++) {
        Trend trend = new Trend();
        trend.id = trending.data![i].id!;
        trend.category = trending.data![i].category!;
        trend.header = trending.data![i].header!;
        trend.publish = trending.data![i].publish!;
        trend.title = trending.data![i].title!;
        listTrend!.add(trend);
      }

      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }

  getAllRecommendedFromApi() async {
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
        ApiEndPoints.contentEndpoints.RecommendedContent +
        "/10/1");
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
      listRecommended?.clear();
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

        listRecommended!.add(content);
      }
      print(listRecommended);
      listRecommended?.refresh();
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }
}
