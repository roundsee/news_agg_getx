import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/news_item_model.dart';
import 'package:new_agg/core/models/search_result.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchResultController extends GetxController
    with GetSingleTickerProviderStateMixin {
  dynamic argumentData = Get.arguments;

  //RxList<Content> allNewsPerCategory = (List<Content>.of([])).obs;
  RxList<ContentSearchResult> searchResult =
      (List<ContentSearchResult>.of([])).obs;
  //TextEditingController searchController = TextEditingController();
  //ScrollController scrollController = ScrollController();
  //RxBool categoryNotFound = false.obs;
  //RxBool isLoading = false.obs;

  @override
  void onInit() {
    if (argumentData == null) {
    } else {
      SearchNews(argumentData[0]['idcategory'], argumentData[1]['keyword']);
    }

    //print(argumentData[0]['idcategory']);
    //getNewsPerCategories(argumentData[0]['idcategory']);
    //print(argumentData[1]['second']);
    super.onInit();
  }

  SearchNews(int categoryId, String searchText) async {
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
    searchResult.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      SearchResult newsResults = SearchResult.fromJson(jsonDecode(res.body));
      var imageurl;
      for (int i = 0; i < newsResults.data!.content!.length; i++) {
        ContentSearchResult newsContent = new ContentSearchResult();
        newsContent.id = newsResults.data!.content![i].id;
        newsContent.category = newsResults.data!.content![i].category;

        newsContent.title = newsResults.data!.content![i].title;
        imageurl = newsResults.data!.content![i].header;

        if (await isValidUrl(imageurl)) {
          newsContent.header = imageurl;
        } else {
          newsContent.header =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        }
        newsContent.datePublish = newsResults.data!.content![i].datePublish;
        newsContent.title = newsResults.data!.content![i].title;
        searchResult.value!.add(newsContent);
      }
      print(searchResult);

      update();
    } else {
      update();
    }
  }
}
