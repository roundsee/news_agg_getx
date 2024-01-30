import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/forgot_pass_one_screen/models/forgot_pass_one_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for the ForgotPassOneScreen.
///
/// This class manages the state of the ForgotPassOneScreen, including the
/// current forgotPassOneModelObj
class ForgotPassOneController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxString tokenPass = "".obs;

//  Rx<ForgotPassOneModel> forgotPassOneModelObj = ForgotPassOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  ForgotPasswordRequest() async {
    //var pref = new PrefUtils();
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = pref.getUserToken();

    //token =
    //  "1701932392_0FZgPySf92ivu6jrhFWiWepjkNJapk4jTLvx3shT_00a7c4fe-837c-455b-9b8d-ad5fadd0b815";

    var headers = getHeaders("defaulttoken");
    /* {
      'Content-Type': 'application/json',
      'Authorization': token,
      'Accept-Language': 'ID',
      'User-Agent': 'LENOVO ideapad 3'
    };
    */
    Map body = {'email': emailController.text};
    var strbody = jsonEncode(body);
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.readersEndpoints.forgetrequest);
    //_SimpleUri (https://a1c1-103-124-115-148.ngrok-free.app/api/contents/single/bad3762c-9d48-4ecc-aad4-310b26d7b219)

    http.Response res = await http.post(url, headers: headers, body: strbody);

    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      ForgotPassModel respon = ForgotPassModel.fromJson(jsonDecode(res.body));
      var token = respon.data!.user!.token.toString();
      tokenPass.value = token;

      Get.toNamed(AppRoutes.inputOTPScreen, arguments: [
        [token, emailController.text]
      ]);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      Get.snackbar(
        "Forgot Password",
        data['message'],
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
