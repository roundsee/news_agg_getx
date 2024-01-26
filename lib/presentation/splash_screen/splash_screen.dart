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
  final splashController = Get.put(SplashController());

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
/*
static Future<String> getFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Session') ?? '';
  }
  var strToken = getToken().toString();
*/

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
              Image.asset(ImageConstant.imgLogoAni),
              //Image.asset("images/logoani.gif", height: 200.0, width: 200.0)
              /*
              CustomImageView(
                imagePath: ImageConstant.imgLogo3,
                height: 92.v,
                width: 157.h,
                /*
                onTap: () {
                  if (strToken != "") {
                    //homePageWithTabPage
                    // Get.toNamed(AppRoutes.homePageWithTabPage);
                    Get.toNamed(
                        AppRoutes.alternativeHomePageDesignContainerScreen);
                  } else {
                    Get.toNamed(
                      AppRoutes.loginPageScreen,
                    );
                  }
                },
                */
              ),
            */
              /*
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 2000),
                  top: 80,
                  left: splashController.animate.value ? 0 : -80,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ),
            */
            ],
          ),
        ),
      ),
    );
  }
}
