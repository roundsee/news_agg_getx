import 'controller/home_page_with_tab_controller.dart';
import 'models/home_page_with_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/home_page/home_page.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePageWithTabPage extends StatelessWidget {
  HomePageWithTabPage({Key? key}) : super(key: key);

  HomePageWithTabController controller =
      Get.put(HomePageWithTabController(HomePageWithTabModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 13.v),
                  Padding(
                      padding: EdgeInsets.only(left: 25.h, right: 24.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "lbl_search".tr)),
                  SizedBox(height: 17.v),
                  _buildFrame(),
                  Expanded(
                      child: SizedBox(
                          height: 443.v,
                          child: TabBarView(
                              controller: controller.tabviewController,
                              children: [
                                HomePage(),
                                HomePage(),
                                HomePage(),
                                HomePage()
                              ])))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 47.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgCharmMenuHamburger,
            margin: EdgeInsets.only(left: 23.h, top: 14.v, bottom: 14.v)),
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgLogo3),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMdiBellNotification,
              margin: EdgeInsets.symmetric(horizontal: 23.h, vertical: 14.v),
              onTap: () {
                onTapMdiBellNotification();
              })
        ]);
  }

  /// Section Widget
  Widget _buildFrame() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 20.v,
              width: 266.h,
              child: TabBar(
                  controller: controller.tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(
                      fontSize: 10.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400),
                  unselectedLabelColor: appTheme.whiteA700,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 10.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400),
                  indicator: BoxDecoration(
                      color: appTheme.indigo700,
                      borderRadius: BorderRadius.circular(10.h)),
                  tabs: [
                    Tab(child: Text("lbl_politics".tr)),
                    Tab(child: Text("lbl_economics".tr)),
                    Tab(child: Text("lbl_school".tr)),
                    Tab(child: Text("lbl_healthy".tr))
                  ])),
          Container(
              width: 52.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_sports".tr,
                  style: CustomTextStyles.bodySmallWhiteA700))
        ]);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapMdiBellNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }
}
