import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'dart:convert';
import 'package:new_agg/core/app_export.dart';
//import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/models/newtrending_model.dart';
import 'package:new_agg/core/utils/checkurl.dart';
//import 'package:new_agg/presentation/history_page/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the HistoryPage.
///
/// This class manages the state of the HistoryPage, including the
/// current historyModelObj
class NewTrendingController extends GetxController {
  // HistoryController();
  // CategoriesController categoriesController = Get.put(CategoriesController());
  //Rx<HistoryModel> historyModelObj;
  RxList<Content> listTrending = (List<Content>.of([])).obs;
  //List<Content> listHistory = <Content>[].obs;
  TextEditingController searchController = TextEditingController();
//Rx<NewsDetailModel> newsModelObj = NewsDetailModel().obs;
  RxBool newsNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getNewsTrending();
    super.onInit();
  }

  //getNewsHistory(var categoryId, [String searchText = '']) async {
  getNewsTrending() async {
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
//Dashboard Outstanding DO against Invoice
    // bool isSearch = false;
    //if (searchText == "") {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.TrendingContent);
    //    "/" +
    //    categoryId.toString());
    //res = await http.get(url, headers: headers);
    //} else {
    //  isSearch = true;
    //  var url = Uri.parse(
    //      ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.HistoryContent);
    //  Map body = {'categories': categoryId.toString(), 'key': searchText};

    //var strbody = jsonEncode(body);
    // res = await http.post(url, headers: headers, body: strbody);
    //}

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    // listTrending.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      NewTrendingModel trendingList =
          NewTrendingModel.fromJson(jsonDecode(res.body));

      for (int i = 0; i < trendingList.data!.length; i++) {
        Content itemTrending = new Content();
        itemTrending.id = trendingList.data![i].content?.id.toString();
        itemTrending.category =
            trendingList.data![i].content?.category.toString();
        itemTrending.header = trendingList.data![i].content?.header.toString();
        itemTrending.publish =
            trendingList.data![i].content?.publish.toString();
        itemTrending.title = trendingList.data![i].content?.title.toString();
        var imageurl = trendingList.data![i].content?.header.toString();
        //imageurl = content.header;
        if (await isValidUrl(imageurl!)) {
          itemTrending.header = imageurl;
        } else {
          itemTrending.header =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        }

        listTrending.add(itemTrending);
      }
      print(listTrending);
      listTrending.refresh();
      isLoading.value = false;
      update();
      //} else {
      isLoading.value = false;
      //categoryNotFound.value = true;
      update();
      //   }
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
}
