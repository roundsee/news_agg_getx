import 'dart:ffi';

import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_agg/core/utils/checkurl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the NewsScreen.
///
/// This class manages the state of the NewsScreen, including the
/// current newsModelObj
class NewsController extends GetxController with StateMixin {
  //TextEditingController frameFiftyNineController = TextEditingController();
  dynamic argumentData = Get.arguments;
  Rx<NewsDetailModel> newsModelObj = NewsDetailModel().obs;
  RxBool newsNotFound = false.obs;
  RxBool isLoading = false.obs;
  RxString test = "".obs;
  RxString title = "".obs;
  RxString description = "".obs;
  RxString imgUrl = "".obs;
  RxString like = "".obs;
  RxString save = "".obs;
  RxString share = "".obs;
  RxString jlike = "".obs;
  RxString jshare = "".obs;
  RxString jsave = "".obs;

  @override
  void onInit() {
    if (argumentData == null) {
      // getNewsDetail("bad3762c-9d48-4ecc-aad4-310b26d7b219");
    } else {
      getNewsDetail(argumentData[0]['id']);
    }

    //print(argumentData[0]['idcategory']);
    //getNewsPerCategories(argumentData[0]['idcategory']);
    //print(argumentData[1]['second']);
    super.onInit();
  }

  void onClose() {
    super.onClose();
    //frameFiftyNineController.dispose(
    //);
  }

  /*
    getData() {
            // make status to loading
            change(null, status: RxStatus.loading());

            // Code to get data
            await service.getData()

          // if done, change status to success
          change(null, status: RxStatus.success());
        }
  */
  getNewsDetail(var idNews) async {
    //Creates a new Uri object by parsing a URI string.
    isLoading.value = true;

    title.value = "";
    description.value = "";
    imgUrl.value = "";
    like.value = "";
    save.value = "";
    jlike.value = "0";
    jsave.value = "0";
    jshare.value = "0";
    change(null, status: RxStatus.loading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token').toString();
    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = getHeaders("req");

    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.contentEndpoints.DetailContent +
        "/" +
        idNews.toString());
    //_SimpleUri (https://a1c1-103-124-115-148.ngrok-free.app/api/contents/single/bad3762c-9d48-4ecc-aad4-310b26d7b219)

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 404) {
      newsNotFound.value = true;
      isLoading.value = false;
    }
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.

      NewsDetailModel detailNews =
          NewsDetailModel.fromJson(jsonDecode(res.body));
      newsModelObj.value = detailNews;
      title.value = detailNews.data!.content!.title.toString();
      description.value = detailNews.data!.content!.body.toString();
      imgUrl.value = detailNews.data!.content!.header.toString();
      like.value = detailNews.data!.content!.interaction!.like.toString();
      save.value = detailNews.data!.content!.interaction!.save.toString();
      jlike.value = detailNews.data!.content!.statistics!.like.toString();
      jsave.value = detailNews.data!.content!.statistics!.save.toString();
      jshare.value = detailNews.data!.content!.statistics!.share.toString();
      isLoading.value = false;
      change(null, status: RxStatus.success());
      newsNotFound.value = true;
      update();
    }
    test.value = "Helloooooo";
    print(newsModelObj.value);
    newsModelObj.refresh();
    isLoading.value = false;
    update();
  }
}
