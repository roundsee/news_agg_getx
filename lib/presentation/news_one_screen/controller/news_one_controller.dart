import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/interaction_model.dart';
import 'package:new_agg/core/models/news_detail.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/news_one_screen/models/news_one_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// A controller class for the NewsOneScreen.
///
/// This class manages the state of the NewsOneScreen, including the
/// current newsOneModelObj
class NewsOneController extends GetxController {
  TextEditingController frameFiftyNineController = TextEditingController();

  Rx<NewsOneModel> newsOneModelObj = NewsOneModel().obs;
  //Rx<Content> newsDetail = Rx<Content>().obs;
  //final newsDetail = Rxn<Content>();
  //var newsDetail = Content().obs;

  dynamic argumentData = Get.arguments;
  Rx<NewsDetailModel> newsModelObj = NewsDetailModel().obs;
  RxBool newsNotFound = false.obs;
  RxBool isLoading = false.obs;

  RxString test = "".obs;

  var title = "".obs;
  var description = "".obs;
  var imgUrl = "".obs;
  var author = "".obs;
  var publish = "".obs;
  var like = "".obs;
  var save = "".obs;
  var share = "".obs;
  var jlike = 0.obs;
  var jshare = 0.obs;
  var jsave = 0.obs;
  var idn = "".obs;

  @override
  void onInit() {
    if (argumentData == null) {
      getNewsDetail("bad3762c-9d48-4ecc-aad4-310b26d7b219");
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
    frameFiftyNineController.dispose();
  }

  getNewsDetail(var idNews) async {
    //Creates a new Uri object by parsing a URI string.
    isLoading.value = true;

    //change(null, status: RxStatus.loading());
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
        ApiEndPoints.contentEndpoints.DetailContent +
        "/" +
        idNews.toString());
    //_SimpleUri (https://a1c1-103-124-115-148.ngrok-free.app/api/contents/single/bad3762c-9d48-4ecc-aad4-310b26d7b219)
    Map body = {
      'token': token,
    };

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
      // newsDetail.value = detailNews;
      var imageurl;
      title.value = detailNews.data!.content!.title.toString();
      description.value = detailNews.data!.content!.body.toString();
      imageurl = detailNews.data!.content!.header.toString();
      //imageurl = content.header;
      if (await isValidUrl(imageurl)) {
        imgUrl.value = imageurl;
      } else {
        imgUrl.value =
            "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
      }
      //imgUrl.value = imageurl;
      //detailNews.data!.content!.header.toString();
      author.value = detailNews.data!.content!.author.toString();
      publish.value = detailNews.data!.content!.publish.toString();
      like.value = detailNews.data!.content!.interaction!.like.toString();
      save.value = detailNews.data!.content!.interaction!.save.toString();
      jlike.value = detailNews.data!.content!.statistics!.like!;
      jsave.value = detailNews.data!.content!.statistics!.save!;
      //detailNews.data!.content!.statistics!.save.toString() as int;
      jshare.value = detailNews.data!.content!.statistics!.share!;
      idn.value = idNews;
      isLoading.value = false;
      //change(null, status: RxStatus.success());
      newsNotFound.value = true;
      update();
    }
    test.value = "Helloooooo";
    print(newsModelObj.value);
    newsModelObj.refresh();
    isLoading.value = false;
    update();
  }

  InteractionClick(var idNews, var actionType) async {
    //Creates a new Uri object by parsing a URI string.
    isLoading.value = true;

    //change(null, status: RxStatus.loading());
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
    var eps = "";
    switch (actionType) {
      case 1: // Like
        eps = ApiEndPoints.interactionEndpoints.like;
        break;
      case 2: // Save
        eps = ApiEndPoints.interactionEndpoints.save;
        break;
      case 3: // Share
        eps = ApiEndPoints.interactionEndpoints.share;
        break;
      default:
        return "/";
    }
    var url = Uri.parse(ApiEndPoints.baseUrl + eps);

    Map body = {'id_news': idNews.toString()};
    var strbody = jsonEncode(body);
    http.Response res = await http.post(url, headers: headers, body: strbody);

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

      InteractionModel interaction =
          InteractionModel.fromJson(jsonDecode(res.body));

      switch (actionType) {
        case 1: // Like
          like.value =
              interaction.message.toString() == "Like added" ? "1" : "0";
          if (like.value == "1") {
            jlike = jlike + 1;
          } else {
            jlike = jlike - 1;
          }
          break;
        case 2: // Save
          save.value =
              interaction.message.toString() == "Save added" ? "1" : "0";
          if (save.value == "1") {
            jsave = jsave + 1;
          } else {
            jsave = jsave - 1;
          }

          break;
        case 3: // Share
          eps = ApiEndPoints.interactionEndpoints.share;
          break;
        default:
          return "/";
      }
      print("like: " + like.value);
      print("save: " + save.value);
      isLoading.value = false;
      //change(null, status: RxStatus.success());
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
