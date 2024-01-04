/*
import 'dart:convert';

import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/presentation/select_fav_category_screen/models/categorychipitems_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  //var isLoading = true.obs;
  Future<List<ChipCategory>> fetchDataCategory() async {
    try {
      // isLoading(true);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs!.getString('token').toString();

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
        'User-Agent': 'LENOVO ideapad 3'
      };

      List<ChipCategory> tmp = [];
      tmp.add(ChipCategory(idx: 0, isSelected: 0, title: ""));
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.categories);
      Map body = {
        'token': token,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        tmp = jsonResponse.map((data) => ChipCategory.fromJson(data)).toList();
        return tmp;
        //jsonResponse.map((data) => ChipCategory.fromJson(data)).toList();

        ///data successfully
        //var result = jsonDecode(response.body);

        //categoryModel = Category.fromJson(result);
      }
      return tmp;
    } catch (e) {
      //print('Error while getting data is $e');
      // isLoading(false);
      throw e;
    }
  }

  Future<int> SaveFavCategory(String SelectedCategory) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString('token').toString();
    var id_user = prefs!.getString('id_user').toString();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
        'User-Agent': 'LENOVO ideapad 3'
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {'id_user': id_user, 'id_category': SelectedCategory};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(response);
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          return 1;
          //Get.off(AlternativeHomePageDesignContainerScreen());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      return 0;
      /*
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
      */
    }
  }
}
*/