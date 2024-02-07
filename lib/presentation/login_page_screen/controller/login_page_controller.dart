import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/core/utils/sharedprefs.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/alternative_home_page_design_container_screen.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/home_page_with_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_agg/presentation/select_fav_category_screen/select_fav_category_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageController extends GetxController {
/*
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;
*/

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//================================================//

  Future<void> loginWithEmail() async {
    var headers = getHeaders("defaulttoken");
    /* var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
      'User-Agent': 'LENOVO ideapad 3'
    };
    */

    try {
      //final SharedPreferences prefs = await SharedPreferences.getInstance();

      var fcmtoken = SharedPrefs().fcm;
      // prefs!.getString('FCMToken').toString();
      if (fcmtoken == "") {
        fcmtoken = (await FirebaseMessaging.instance.getToken())!;
        //prefs!.setString('FCMToken', fcmtoken);
        SharedPrefs().fcm = fcmtoken;
      }
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      var headers = getHeaders("defaulttoken");
      /*
      var headers = {
        'Content-Type': 'application/json',
        'User-Agent': 'LENOVO ideapad 3',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
        'fcm': fcmtoken
      };
      */
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      var strbody = jsonEncode(body);
      http.Response response =
          await http.post(url, body: strbody, headers: headers);
      print(response);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['data']['access_token'];
        Logger.log("token:" + token);
        SharedPrefs().token = token;
        SharedPrefs().userid = json['data']['user']['id'];
        SharedPrefs().username = json['data']['user']['name'];
        //final SharedPreferences? prefs = await _prefs;
        //await prefs?.setString('token', token);

        emailController.clear();
        passwordController.clear();

        if (json['data']['user']['status'] == 2) {
          SharedPrefs().status = "2";
          //  var token = json['data']['access_token'];
          //  prefx.setUserToken(token);
          //prefx.setStatusUser("2");
          //final SharedPreferences? prefs = await _prefs;
          //await prefs?.setString('token', token);
          //await prefs?.setString('statuscode', "2");
          //Get.to((HomePage));
          Get.to(() => AlternativeHomePageDesignContainerScreen());
        }

        if (json['data']['user']['status'] == 1) {
          //prefx.setUserToken(token);

          SharedPrefs().status = "1";
          //await prefs?.setString('statuscode', "1");
          // Get.off(SelectFavCategoryScreen());
          Get.to(() => SelectFavCategoryScreen());
          //Get.to((SelectFavCategoryScreen()));
        }
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar(
          "Login",
          json['message'],
          icon: Icon(Icons.person, color: Colors.white),
          duration: const Duration(seconds: 7),
          snackPosition: SnackPosition.BOTTOM,
        );
        //throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Login Fail'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d',
        'User-Agent': 'LENOVO ideapad 3'
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerSSO);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        //'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(response);
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(HomePageWithTabPage());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
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
    }
  }

//=============================================//
/*
  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }
  */
}
