import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'dart:convert';
import 'package:new_agg/core/app_export.dart';
//import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/models/history_model.dart';
//import 'package:new_agg/presentation/history_page/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the HistoryPage.
///
/// This class manages the state of the HistoryPage, including the
/// current historyModelObj
class HistoryController extends GetxController {
  // HistoryController();
  //CategoriesController categoriesController = Get.put(CategoriesController());
  //Rx<HistoryModel> historyModelObj;
  RxList<Content> listHistory = (List<Content>.of([])).obs;
  //List<Content> listHistory = <Content>[].obs;
  TextEditingController searchController = TextEditingController();
//Rx<NewsDetailModel> newsModelObj = NewsDetailModel().obs;
  RxBool newsNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getNewsHistory();
    super.onInit();
  }

  //getNewsHistory(var categoryId, [String searchText = '']) async {
  getNewsHistory() async {
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
    //if (searchText == "") {
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.historyEndpoints.history);
    //    "/" +
    //    categoryId.toString());
    res = await http.get(url, headers: headers);
    //} else {
    //  isSearch = true;
    //  var url = Uri.parse(
    //      ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.HistoryContent);
    //  Map body = {'categories': categoryId.toString(), 'key': searchText};

    //var strbody = jsonEncode(body);
    // res = await http.post(url, headers: headers, body: strbody);
    //}

    ///http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    listHistory.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      ListHistoryModel historiesList =
          ListHistoryModel.fromJson(jsonDecode(res.body));

      for (int i = 0; i < historiesList.data!.length; i++) {
        Content itemHistory = new Content();
        itemHistory.id = historiesList.data![i].content?.id;
        itemHistory.category = historiesList.data![i].content?.category;
        itemHistory.header = historiesList.data![i].content?.header;
        itemHistory.publish = historiesList.data![i].content?.publish;
        itemHistory.title = historiesList.data![i].content?.title;

        listHistory.add(itemHistory);
      }
      print(listHistory);
      //listHistory.refresh();
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      //categoryNotFound.value = true;
      update();
    }
  }
/*
  SearchNews(var categoryId, [String searchText = '']) async {
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
  */
}
