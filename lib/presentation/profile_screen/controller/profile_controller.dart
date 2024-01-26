import 'package:new_agg/core/api_endpoint/api_endpoints.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/user_profile_model.dart';
import 'package:new_agg/core/utils/checkurl.dart';
import 'package:new_agg/presentation/profile_screen/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A controller class for the ProfileScreen.
///
/// This class manages the state of the ProfileScreen, including the
/// current profileModelObj
class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;

  var id = "".obs;
  var name = "".obs;
  var email = "".obs;
  var status = "".obs;
  var birthday = "".obs;
  var gender = "".obs;
  var photo = "".obs;

  @override
  void onClose() {
    super.onClose();
  }

  void onInit() {
    GetProfile();
    super.onInit();
  }

  GetProfile() async {
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
    //https://sandbox-nooz.digiprimatera.co.id/api/readers/profile
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.profile);

    http.Response res = await http.get(url, headers: headers);
    if (res.statusCode == 401) {
      Get.toNamed(
        AppRoutes.loginPageScreen,
      );
    }
    if (res.statusCode == 200) {
      //Parses the string and returns the resulting Json object.
      UserProfile userProfile = UserProfile.fromJson(jsonDecode(res.body));
      name.value = userProfile.data!.name.toString();
      email.value = userProfile.data!.email.toString();
      status.value = userProfile.data!.status.toString();
      birthday.value = userProfile.data!.birthday.toString() == "null"
          ? "2000-01-01"
          : userProfile.data!.birthday.toString();
      gender.value = userProfile.data!.gender.toString();

      var imageurl = userProfile.data!.photo.toString();
      //imageurl = content.header;
      if (await isValidUrl(imageurl)) {
        photo.value = imageurl;
      } else {
        photo.value =
            "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7898.jpg?w=2000&t=st=1705367389~exp=1705367989~hmac=15d172d57e2f959df17fbdc8dcbd6a0e0a6506671ed0aaa3e27a93b2ca8afc46";
      }
    } else {
      update();
    }
  }
}
