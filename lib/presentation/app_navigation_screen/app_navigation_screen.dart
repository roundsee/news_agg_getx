import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "splash screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Pass Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPassTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Pass".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPassScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Push Notification".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.pushNotificationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forgot Pass One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgotPassOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "StartPage".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.startpageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "Alternative Home Page Design - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                              .alternativeHomePageDesignContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.newsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Blokir comment".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.blokirCommentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Register Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.registerPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Select Fav Category".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.selectFavCategoryScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Filter Search".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.filterSearchScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Notification".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Fav Category".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.favCategoryScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "story news".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.storyNewsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.searchPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Ukuran Text".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ukuranTextScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Bahasa".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.bahasaScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.newsOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Search page filter kategori".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.searchPageFilterKategoriScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Alternative Home Page Design One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.alternativeHomePageDesignOneScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
