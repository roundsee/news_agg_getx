import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  RxString nama = "".obs;
  RxString birthdate = "".obs;
  RxString gender = "".obs;
  RxString photo = "".obs;
  TextEditingController namaController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  SetProfile(String xnama, String xdate, String xgender, String xphoto) {
    nama.value = xnama;
    namaController.text = nama.value;
    birthdate.value = xdate;
    dateController.text = birthdate.value;
    gender.value = xgender;
    genderController.text = gender.value;
    photo.value = xphoto;
    nama.refresh();
    birthdate.refresh();
    gender.refresh();
    photo.refresh();
  }

  SetBirtdate(String xdate) {
    birthdate.value = xdate;
    dateController.text = birthdate.value;
    birthdate.refresh();
  }

  Setname(String xnama) {
    nama.value = xnama;
    namaController.text = nama.value;
    nama.refresh();
  }

  SetGender(String xgender) {
    gender.value = xgender;
    genderController.text = gender.value;
    gender.refresh();
  }

  UpdateProfile(String xnama, String xbirtdate, String xgender) async {
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

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.readersEndpoints.updateProfile);
    Map body = {'nama': nama, 'birthdate': birthdate, 'gender': gender};

    var strbody = jsonEncode(body);
    http.Response res = await http.post(url, headers: headers, body: strbody);

    ///http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    //searchResult.clear();
    if (res.statusCode == 200) {
      Get.snackbar(
        "Success Update Profile",
        "Profile Updated ",
        icon: Icon(Icons.person, color: Colors.white),
        duration: const Duration(seconds: 7),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
      update();
    } else {
      update();
    }
  }
}
