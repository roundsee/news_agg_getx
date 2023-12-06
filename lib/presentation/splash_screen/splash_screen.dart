import 'package:shared_preferences/shared_preferences.dart';

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({Key? key})
      : super(
          key: key,
        );
  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  var strToken = getToken().toString();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 182.v),
          child: Column(
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgLogo3,
                height: 92.v,
                width: 157.h,
                onTap: () {
                  if (strToken != "") {
                    Get.toNamed(
                      AppRoutes.selectFavCategoryScreen,
                    );
                  } else {
                    Get.toNamed(
                      AppRoutes.loginPageScreen,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
