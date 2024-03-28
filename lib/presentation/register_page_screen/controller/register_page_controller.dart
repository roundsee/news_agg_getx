import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/home_page/home_page.dart';
import 'package:new_agg/presentation/login_page_screen/login_page_screen.dart';
import 'package:new_agg/presentation/register_page_screen/models/register_page_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/presentation/select_fav_category_screen/select_fav_category_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for the RegisterPageScreen.
///
/// This class manages the state of the RegisterPageScreen, including the
/// current registerPageModelObj
class RegisterPageController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  //Rx<RegisterPageModel> registerPageModelObj = RegisterPageModel().obs;

  Rx<bool> iVeReadAndAgree = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            '1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d'
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(response);
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);

        Get.snackbar(
          "Success Registration",
          "Congratulation, your account has been successfully created, We have sent activation email to " +
              emailController.text +
              ". Click 'Activate Now' to confirm registraton",
          icon: Icon(Icons.person, color: Colors.white),
          duration: const Duration(seconds: 7),
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(LoginPageScreen());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      var msg = "";
      if (nameController.text == "") {
        msg = msg + "Name must be filled" + "\r\n";
      }
      if (emailController.text == "") {
        msg = msg + "Email must be filled" + "\r\n";
      }
      if (passwordController.text != confirmPasswordController.text &&
          passwordController.text != "") {
        msg = msg + "Password does'nt match";
      }

      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Message'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(msg)],
            );
          });
    }
  }

  void showAutoDismissAlert(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        // Schedule a delayed dismissal of the alert dialog after 3 seconds
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
        });
        // Return the AlertDialog widget
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
        );
      },
    );
  }
}
