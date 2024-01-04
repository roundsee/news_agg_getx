import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/models/content_per_category.dart';
//import 'package:new_agg/presentation/home_page/models/news_per_category.dart';
import 'package:new_agg/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../select_fav_category_screen/models/category.dart';
//import '../models/category.dart';

class HomeContentCategoryController extends GetxController {
  // for list view
  Rx<ContentPerCategory> allCategory = ContentPerCategory().obs;
  //<List<Content>> listCategory = <[].obs;
  List<Content>? listContent = <Content>[].obs;

  RxBool categoryNotFound = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    //  scrollController = ScrollController()..addListener(_scrollListener);
    //getAllContentCategoryFromApi();
    super.onInit();
  }

  // function to retrieve a JSON response for all news from newsApi.org
  getAllContentCategoryFromApi() async {
    //Creates a new Uri object by parsing a URI string.

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token').toString();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'id',
      'User-Agent': 'LENOVO ideapad 3'
    };
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.contentEndpoints.CategoryContent);
    Map body = {
      'token': token,
    };
    http.Response res = await http.get(url, headers: headers);
    //http.Response res =
    //    await http.post(url, body: jsonEncode(body), headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      ContentPerCategory contentCategoryData =
          ContentPerCategory.fromJson(jsonDecode(res.body));
      allCategory.value = contentCategoryData;
      for (int i = 0; i < contentCategoryData.data!.length; i++) {
        Content content = new Content();
        content.category = contentCategoryData.data![i].content!.category;
        content.description = contentCategoryData.data![i].content!.category;
        content.header = contentCategoryData.data![i].content!.header;
        content.id = contentCategoryData.data![i].content!.id;
        content.interaction = contentCategoryData.data![i].content!.interaction;
        content.statistics = contentCategoryData.data![i].content!.statistics;
        content.publish = contentCategoryData.data![i].content!.publish;
        content.slug = contentCategoryData.data![i].content!.slug;
        content.source = contentCategoryData.data![i].content!.source;
        content.title = contentCategoryData.data![i].content!.title;

        listContent!.add(content);
      }

      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      categoryNotFound.value = true;
      update();
    }
  }
}
