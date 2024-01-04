import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/trending.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrendingsController extends GetxController {
  // for list view
  List<Trend> allTrending = <Trend>[];
  // for carousel

  ScrollController scrollController = ScrollController();
  RxBool trendNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getTrendings();
    super.onInit();
  }

  getTrendings() async {
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
      Trending trendings = Trending.fromJson(jsonDecode(res.body));

      for (int i = 0; i < trendings.data!.length; i++) {
        Trend trend = new Trend();
        trend.id = trendings.data![i].id!;
        trend.category = trendings.data![i].category!;
        trend.header = trendings.data![i].header!;
        trend.publish = trendings.data![i].publish!;
        trend.title = trendings.data![i].title!;

        allTrending!.add(trend);
      }

      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      trendNotFound.value = true;
      update();
    }
  }
}
