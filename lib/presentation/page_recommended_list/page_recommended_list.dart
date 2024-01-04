import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/controllers/news_controller.dart';
import 'package:new_agg/core/controllers/recommended_list_controller.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/presentation/home_page/widgets/side_drawer.dart';
import 'package:new_agg/presentation/news_screen/news_screen.dart';
import '../../core/controllers/news_per_cagory_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class PageRecommendedList extends StatelessWidget {
  PageRecommendedList({Key? key}) : super(key: key);

  RecommendedListController controller = Get.put(RecommendedListController());
  //CategoriesController categoriesController = Get.put(CategoriesController());
  //NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: appTheme.whiteA700,
                centerTitle: true,
                title: AppbarTitleImage(imagePath: ImageConstant.imgLogo3),
                actions: [
                  AppbarTrailingImage(
                      imagePath: ImageConstant.imgMdiBellNotification,
                      margin: EdgeInsets.symmetric(
                          horizontal: 23.h, vertical: 14.v),
                      onTap: () {
                        onTapMdiBellNotification();
                      })
                ]),
            //_buildAppBar(),
            /*
            drawer: Container(
                width: 220,
                child: sideDrawer(categoriesController)), //categoriesController
            */
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 13.v),
                  Padding(
                      padding: EdgeInsets.only(left: 25.h, right: 24.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "lbl_search".tr)),
                  SizedBox(height: 10.v),
                  //Obx(() =>  _buildListSearchResult()),
                  SingleChildScrollView(
                    child: Column(
                        // padding: EdgeInsets.only(left: 20.h, right: 23.h),
                        children: [
                          Obx(
                            () => Container(
                              height: 500,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: List.generate(
                                    controller.allRecommended
                                        .length, // .allNewsPerCategory.value.length,
                                    (index) {
                                  return _buildCardNewsColumn(
                                      controller.allRecommended[index]);
                                }),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 17.v),
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

  Widget _buildListRecommended() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: List.generate(controller.allRecommended.length, (index) {
              return _buildCardNewsColumn(controller.allRecommended[index]);
            })));
  }

  Widget _buildCardNewsColumn(Content theNews) {
    return GestureDetector(
        onTap: () {
          onTapCardNewsColumn(theNews.id.toString());
        },
        child: Container(
            height: 150,
            margin: EdgeInsets.only(left: 28.h, right: 21.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 10.v),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 287.h,
                margin: EdgeInsets.only(right: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.v),
                child: Row(children: [
                  Container(
                    decoration: AppDecoration.fillWhiteA7001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    width: 200,
                    child: Column(children: [
                      Text(theNews.title.toString(),
                          style: theme.textTheme.labelLarge),
                      Row(children: [
                        Text(theNews.publish.toString(),
                            style: theme.textTheme.labelSmall),
                        Text(theNews.category.toString(),
                            style: theme.textTheme.labelSmall)
                      ]),
                    ]),
                  ),
                  Container(
                      decoration: AppDecoration.fillBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.network(theNews.header.toString(),
                              fit: BoxFit.cover),
                        ),
                      ))
                ]),
              ),
              SizedBox(height: 6.v)
            ])));
  }

  onTapCardNewsColumn(var idnews) {
    //newsController.getNewsDetail(idnews);
    // if (newsController.isLoading.value) {
    //} else {
    //newsController.getNewsDetail(idnews);
    Get.toNamed(AppRoutes.newsScreen, arguments: [
      {"id": idnews}
    ]);

    //Get.to(() => NewsScreen(), arguments: [
    //  {"id": idnews}
    //]);
    //}
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapMdiBellNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }
}
