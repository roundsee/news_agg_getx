import 'package:new_agg/core/utils/sharedprefs.dart';
import 'package:new_agg/presentation/history_page/history_page.dart';
import 'package:new_agg/presentation/new_trending_page/newtrending_page.dart';
import 'package:new_agg/presentation/profile_screen/profile_screen.dart';
import 'package:new_agg/presentation/startpage_screen/startpage_screen.dart';

import 'controller/alternative_home_page_design_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/berita_yang_di_sukai_page/berita_yang_di_sukai_page.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/home_page_with_tab_page.dart';
import 'package:new_agg/presentation/trending_page_tab_container_page/trending_page_tab_container_page.dart';
import 'package:new_agg/widgets/custom_bottom_bar.dart';

class AlternativeHomePageDesignContainerScreen
    extends GetWidget<AlternativeHomePageDesignContainerController> {
  const AlternativeHomePageDesignContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: PopScope(
      canPop: false,
      child: Scaffold(
          body: Navigator(
              key: Get.nestedKey(1),
              initialRoute: AppRoutes.homePageWithTabPage,
              onGenerateRoute: (routeSetting) => GetPageRoute(
                  page: () => getCurrentPage(routeSetting.name!),
                  transition: Transition.noTransition)),
          bottomNavigationBar: _buildBottomBar()),
    ));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      if (SharedPrefs().token == SharedPrefs().defaultToken) {
        if (type == BottomBarEnum.Trending ||
            type == BottomBarEnum.Profile ||
            type == BottomBarEnum.History) {
          Get.off(StartpageScreen());
        }
      } else
        Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageWithTabPage;
      case BottomBarEnum.Trending:
        //return AppRoutes.trendingPageTabContainerPage;
        return AppRoutes.trendingPage; //
      case BottomBarEnum.History:
        return AppRoutes.historyPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageWithTabPage:
        return HomePageWithTabPage();
      case AppRoutes.trendingPage:
        return NewTrendingPage(); //return TrendingPageTabContainerPage();
      case AppRoutes.historyPage:
        //if (SharedPrefs().token == SharedPrefs().defaultToken) {
        //  return StartpageScreen();
        /*
          AlertDialog(
            title: const Text('History'),
            content: const Text('Login Required. Continue Login ?'),
            actions: [
              TextButton(
                child: const Text("No"),
                onPressed: () => Get.back(),
              ),
              TextButton(
                child: const Text("Yes"),
                onPressed: () => Get.back(),
              ),
            ],
          );
          */
        // } else {
        return HistoryPage();
      //}

      case AppRoutes.profileScreen:
        //if (SharedPrefs().token == SharedPrefs().defaultToken) {
        //  return StartpageScreen();
        /*
          AlertDialog(
            title: const Text('Profile'),
            content: const Text('Login Required. Continue Login ?'),
            actions: [
              TextButton(
                child: const Text("No"),
                onPressed: () => Get.back(),
              ),
              TextButton(
                  child: const Text("Yes"),
                  onPressed: () => Get.off(StartpageScreen())),
            ],
          );
          */
        //} else {
        return ProfileScreen();
      //}

      default:
        return DefaultWidget();
    }
  }
}
