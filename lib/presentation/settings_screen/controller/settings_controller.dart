import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/settings_screen/models/settings_model.dart';
import 'package:new_agg/presentation/startpage_screen/startpage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Logout() async {
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
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logout);
    //_SimpleUri (https://a1c1-103-124-115-148.ngrok-free.app/api/contents/single/bad3762c-9d48-4ecc-aad4-310b26d7b219)

    http.Response res = await http.post(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    var defaul_token =
        "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";
    //final SharedPreferences? prefs = await _prefs;
    await prefs!.clear();
    await prefs.setString('token', defaul_token);
    Get.offAll(StartpageScreen());
  }
}
