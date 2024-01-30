import 'package:flutter/material.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/forgot_pass_two_screen.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/models/forgot_pass_two_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';

/// A controller class for the ForgotPassTwoScreen.
///
/// This class manages the state of the ForgotPassTwoScreen, including the
/// current forgotPassTwoModelObj
class ForgotPassTwoController extends GetxController {
  Rx<ForgotPassTwoModel> forgotPassTwoModelObj = ForgotPassTwoModel().obs;
  TextEditingController passText = TextEditingController();
  TextEditingController retypeText = TextEditingController();
  RxString tokenPass = "".obs;
  RxString thePassword = "".obs;
  dynamic argumentData = Get.arguments;
  void onInit() {
    if (argumentData == null) {
    } else {
      //getNewsPerCategories(argumentData[0]['idcategory']);
      passText.text = "";
      retypeText.text = "";
      tokenPass.value = argumentData[0][0];
    }
    super.onInit();
  }

  SubmitNewPass(String newPass) async {
    //var pref = new PrefUtils();
    var header = getHeaders("defaulttoken");
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.readersEndpoints.forgetpasschange);

    Map body = {'token': tokenPass.value, 'password': newPass};
    var strbody = jsonEncode(body);

    http.Response response =
        await http.post(url, headers: header, body: strbody);

    print(response);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      Get.snackbar(
        "Reset Password",
        data['message'],
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.off(LoginPageScreen());
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      Get.snackbar(
        "Reset Password",
        data['message'],
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
      //throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }
}
