import 'dart:convert';

import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/home_page/models/home_model.dart';
//import 'package:new_agg/presentation/home_page/models/news_per_category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

/// A controller class for the HomePage.
///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  HomeController(this.homeModelObj);

  Rx<HomeModel> homeModelObj;
  // Rx<NewsCategory> newsCategory = NewsCategory().obs; // List of Content
  //Rx<RecommendedCategory> newsRecommended = NewsCategory().obs; // List of Content
  //Rx<NewsCategory> newsCategory = NewsCategory().obs; // List of Content

  RxList listContent = [].obs; // Content yg ditampilkan di home page

  @override
  void onInit() {
    //  scrollController = ScrollController()..addListener(_scrollListener);
    //getAllNewsCategoryFromApi();
    super.onInit();
  }
}
