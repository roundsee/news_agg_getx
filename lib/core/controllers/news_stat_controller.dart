import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/news_interaction.dart';
import 'package:new_agg/core/models/search_result.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/core/utils/pref_utils.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsStatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  dynamic argumentData = Get.arguments;

  //RxList<Content> allNewsPerCategory = (List<Content>.of([])).obs;
  RxList<ContentStat> newsStatistic = (List<ContentStat>.of([])).obs;
  //TextEditingController searchController = TextEditingController();
  //ScrollController scrollController = ScrollController();
  //RxBool categoryNotFound = false.obs;
  //RxBool isLoading = false.obs;

  // @override
  // void onInit() {
  //if (argumentData == null) {
  //} else {
  //  SearchNews(argumentData[0]['idcategories'], argumentData[0]['keyword']);
  // }

  //print(argumentData[0]['idcategory']);
  //getNewsPerCategories(argumentData[0]['idcategory']);
  //print(argumentData[1]['second']);
  //   super.onInit();
  // }

  GetStat(String statType) async {
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

    var strEndPoint = "";
    switch (statType) {
      case "like":
        strEndPoint =
            ApiEndPoints.baseUrl + ApiEndPoints.interactionEndpoints.like;
        break;
      case "save":
        strEndPoint =
            ApiEndPoints.baseUrl + ApiEndPoints.interactionEndpoints.save;
        break;
      case "share":
        strEndPoint =
            ApiEndPoints.baseUrl + ApiEndPoints.interactionEndpoints.share;
        break;
      default:
    }
    var url = Uri.parse(strEndPoint);

    res = await http.get(url, headers: headers);

    ///http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    //searchResult.clear();
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      NewsInterraction newsStat =
          NewsInterraction.fromJson(jsonDecode(res.body));
      var imageurl;
      for (int i = 0; i < newsStat.data!.length; i++) {
        ContentStat newsContent = new ContentStat();
        newsContent.id = newsStat.data![i].content!.id;
        newsContent.category = newsStat.data![i].content!.category;

        newsContent.title = newsStat.data![i].content!.title;
        imageurl = newsStat.data![i].content!.header;

        if (await isValidUrl(imageurl)) {
          newsContent.header = imageurl;
        } else {
          newsContent.header =
              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
        }
        newsContent.publish = newsStat.data![i].content!.publish;
        //newsContent.title = newsStat.data![i].content!.publish;
        newsStatistic.value.add(newsContent);
      }
      print(newsStatistic.value);
      newsStatistic.refresh();
      update();
    } else {
      update();
    }
  }
}
