import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/interaction_model.dart';
import 'package:new_agg/core/models/news_detail.dart';
import 'package:new_agg/core/models/suggestion_model.dart';
import 'package:new_agg/core/models/suggestion_model_show.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/core/utils/sharedprefs.dart';
import 'package:new_agg/presentation/news_one_screen/models/news_one_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:social_share/social_share.dart';

/// A controller class for the NewsOneScreen.
///
/// This class manages the state of the NewsOneScreen, including the
/// current newsOneModelObj
class NewsOneController extends GetxController {
  TextEditingController frameFiftyNineController = TextEditingController();

  Rx<NewsOneModel> newsOneModelObj = NewsOneModel().obs;
  RxList<SuggestionModel> listSuggestion = (List<SuggestionModel>.of([])).obs;

  //Rx<Content> newsDetail = Rx<Content>().obs;
  //final newsDetail = Rxn<Content>();
  //var newsDetail = Content().obs;
  Rx<TextStyle> myStyle = TextStyle().obs;
  RxString myLang = "ID".obs;
  dynamic argumentData = Get.arguments;
  Rx<NewsDetailModel> newsModelObj = NewsDetailModel().obs;
  RxBool newsNotFound = false.obs;
  RxBool isLoading = false.obs;

  //RxString theNews = "".obs;

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
  var slug = "".obs;

  @override
  void onInit() {
    getStyle();
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

  getInstalledApps() async {
    SocialShare.checkInstalledAppsForShare().then((data) {
      print(data.toString());
    });
  }

  getNewsDetail(var idNews) async {
    //Creates a new Uri object by parsing a URI string.
    isLoading.value = true;
    Suggested(idNews);
    //change(null, status: RxStatus.loading());

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
      slug.value = detailNews.data!.content!.slug.toString();
      idn.value = idNews;
      isLoading.value = false;

      //change(null, status: RxStatus.success());
      newsNotFound.value = true;

      update();
    }

    print(newsModelObj.value);
    newsModelObj.refresh();
    isLoading.value = false;
    update();
  }

  InteractionClick(var idNews, var actionType) async {
    //Creates a new Uri object by parsing a URI string.
    isLoading.value = true;

    //change(null, status: RxStatus.loading());

    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = getHeaders("req");
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
          share.value = "1";
          jshare = jshare + 1;

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

    print(newsModelObj.value);
    newsModelObj.refresh();
    isLoading.value = false;
    update();
  }

  Suggested(String newsId) async {
    //Creates a new Uri object by parsing a URI string.

    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = getHeaders("req");
    http.Response res;

    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.contentEndpoints.SuggestedContent +
        "/" +
        newsId);
    //Map body = {'categories': categoryId.toString(), 'key': searchText};

    //var strbody = jsonEncode(body);
    res = await http.get(url, headers: headers);

    ///http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    listSuggestion.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      SuggestionNews newsSuggestion =
          SuggestionNews.fromJson(jsonDecode(res.body));
      var imageurl;
      for (int i = 0; i < newsSuggestion.data!.length; i++) {
        SuggestionModel newsContent = new SuggestionModel();
        newsContent.id = newsSuggestion.data![i].content!.id.toString();
        newsContent.category =
            newsSuggestion.data![i].content!.category.toString();
        newsContent.datePublish =
            newsSuggestion.data![i].content!.datePublish.toString();
        newsContent.title = newsSuggestion.data![i].content!.title.toString();
        newsContent.like = newsSuggestion.data![i].statistics!.like;
        newsContent.save = newsSuggestion.data![i].statistics!.save;
        newsContent.share = newsSuggestion.data![i].statistics!.share;
        imageurl = newsSuggestion.data![i].content!.header.toString();

        if (await isValidUrl(imageurl)) {
          newsContent.header = imageurl;
        } else {
          newsContent.header =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        }

        listSuggestion.value.add(newsContent);
      }
      listSuggestion.refresh();
      print(listSuggestion.value);

      update();
    } else {
      update();
    }
  }

  saveOptions(String myOption) {
    // var prefs = new PrefUtils();
    switch (myOption) {
      case "Small":
        SharedPrefs().size = myOption;
        //  prefs.setTextSize(myOption);
        getStyle();
        break;
      case "Kecil":
        SharedPrefs().size = "Small"; // prefs.setTextSize("Small");
        getStyle();
        break;

      case "Medium":
        SharedPrefs().size = myOption;
        getStyle();
        break;

      case "Besar":
        SharedPrefs().size = "Large";
        getStyle();
        break;

      case "Large":
        SharedPrefs().size = myOption;
        getStyle();
        break;

      case "Indonesia":
        SharedPrefs().language = "ID";
        break;

      case "English":
        SharedPrefs().language = "EN";
        break;

      default:
    }
  }

  getStyle() {
    //var myStyle; // = new CustomTextStyles();
    var iStyle;

    iStyle = SharedPrefs().size;
    // prefs.getTextSize();
    switch (iStyle) {
      case "Small":
        myStyle.value = CustomTextStyles.bodySmall10;
        break;
      case "Medium":
        myStyle.value = CustomTextStyles.bodyMediumGray900;
        break;
      case "Large":
        myStyle.value = CustomTextStyles.bodyLargeGray50001;
        break;

      default:
    }
    myStyle.refresh();
    // return myStyle;
  }
}
