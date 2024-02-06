import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/news_item_model.dart';
import 'package:new_agg/core/models/search_result.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/core/utils/pref_utils.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsPerCategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //NewsPerCategoryController();
  // for list view
  dynamic argumentData = Get.arguments;
  //RxList<Content> AllNewsPerCategory = <Content>[].obs;
  RxList<Content> allNewsPerCategory = (List<Content>.of([])).obs;
  RxList<ContentSearchResult> searchResult =
      (List<ContentSearchResult>.of([])).obs;
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

  getNewsPerCategories(var categoryId, [String searchText = '']) async {
    //Creates a new Uri object by parsing a URI string.

    // final SharedPreferences prefs = await SharedPreferences.getInstance();

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
    http.Response res;
    bool isSearch = false;
    if (searchText == "") {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.contentEndpoints.CategoryContent +
          "/" +
          categoryId.toString());
      res = await http.get(url, headers: headers);
    } else {
      isSearch = true;
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.searchEndpoints.searchtext);
      Map body = {'categories': categoryId.toString(), 'key': searchText};

      var strbody = jsonEncode(body);
      res = await http.post(url, headers: headers, body: strbody);
    }

    ///http.Response res = await http.get(url, headers: headers);
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
      var imageUrl = "";
      for (int i = 0; i < newsPerCategories.data!.length; i++) {
        Content newsContent = new Content();
        newsContent.id = newsPerCategories.data![i].content?.id;
        newsContent.category = newsPerCategories.data![i].content?.category;

        //newsContent.header = newsPerCategories.data![i].content?.header;
        print("home_page_with_tab_controllerr");
        imageUrl = newsPerCategories.data![i].content!.header!;
        if (!Uri.tryParse(imageUrl)!.hasAbsolutePath) {
          newsContent.header =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        } else {
          if (await isValidUrl(imageUrl)) {
            newsContent.header = imageUrl;
          } else {
            newsContent.header =
                "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
          }
        }
        newsContent.description =
            newsPerCategories.data![i].content?.description;
        newsContent.slug = newsPerCategories.data![i].content?.slug;
        newsContent.publish = newsPerCategories.data![i].content?.publish;
        newsContent.interaction =
            newsPerCategories.data![i].content?.interaction;
        newsContent.statistics = newsPerCategories.data![i].content?.statistics;
        newsContent.source = newsPerCategories.data![i].content?.source;
        newsContent.title = newsPerCategories.data![i].content?.title;

        allNewsPerCategory.value!.add(newsContent);
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

  SearchNews(var categoryId, [String searchText = '']) async {
    //Creates a new Uri object by parsing a URI string.

    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = getHeaders("req");

    http.Response res;

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.searchEndpoints.searchtext);
    Map body = {'categories': categoryId.toString(), 'key': searchText};

    var strbody = jsonEncode(body);
    res = await http.post(url, headers: headers, body: strbody);

    ///http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    searchResult.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      SearchResult xsearchResult = SearchResult.fromJson(jsonDecode(res.body));

      for (int i = 0; i < xsearchResult.data!.content!.length; i++) {
        ContentSearchResult newsContent = new ContentSearchResult();
        newsContent.id = xsearchResult.data?.content?[i].id;
        newsContent.category = xsearchResult.data?.content?[i].category;
        newsContent.header = xsearchResult.data?.content?[i].header;
        newsContent.title = xsearchResult.data?.content?[i].title;

        searchResult!.add(newsContent);
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
