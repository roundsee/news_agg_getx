import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/forgot_pass_one_screen/models/forgot_pass_one_model.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/forgot_pass_two_screen.dart';
import 'package:new_agg/presentation/forgot_pass_two_screen/models/forgot_pass_two_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for the ForgotPassTwoScreen.
///
/// This class manages the state of the ForgotPassTwoScreen, including the
/// current forgotPassTwoModelObj
class InputOTPController extends GetxController {
  Rx<ForgotPassTwoModel> forgotPassTwoModelObj = ForgotPassTwoModel().obs;

  dynamic argumentData = Get.arguments;
  TextEditingController otpText = TextEditingController();
  RxString tokenPass = "".obs;
  RxBool isResent = false.obs;

  // Resend OTP
  RxString timeRemaining = "100".obs;
  late Timer _timer;
  int _startTime = 100;
  String email = "";

  void onInit() {
    if (argumentData == null) {
    } else {
      //getNewsPerCategories(argumentData[0]['idcategory']);
      tokenPass.value = argumentData[0][0];
      email = argumentData[0][1];
    }
    super.onInit();
  }

  SubmitOTP() async {
    //var pref = new PrefUtils();
    var header = getHeaders("defaulttoken");
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.readersEndpoints.forgetverifotp);

    Map body = {'otp': otpText.text.trim(), 'token': tokenPass.value};
    var strbody = jsonEncode(body);
    http.Response response =
        await http.post(url, headers: header, body: strbody);

    print(response);
    if (response.statusCode == 200) {
      Get.off(ForgotPassTwoScreen(),
          arguments: [tokenPass.value, email]); // Input New Password
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      Get.snackbar(
        "Input OTP",
        data['message'],
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
      //throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }

  ResendOTP() async {
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
    Map body = {'email': email};
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
      tokenPass.refresh();

      //Get.toNamed(AppRoutes.inputOTPScreen, arguments: [token]);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      Get.snackbar(
        "Forgot Password",
        "test",
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
