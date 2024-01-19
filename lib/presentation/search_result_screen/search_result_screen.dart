import 'package:new_agg/core/controllers/search_result_controller.dart';
import 'package:new_agg/core/models/content_per_category.dart';
import 'package:new_agg/core/models/category.dart';

import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/core/models/search_result.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  SearchResultController controller = Get.put(SearchResultController());
  //CategoriesController categoriesController = Get.put(CategoriesController());
  //NewsController newsController = Get.put(NewsController());
  var selectedCategory = 1;
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
                  SizedBox(height: 10.v),
                  //Obx(() =>  _buildListSearchResult()),
                  //_buildListCategoryButton(),
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
                                    controller.searchResult
                                        .length, // .allNewsPerCategory.value.length,
                                    (index) {
                                  return _buildCardNewsColumn(
                                      controller.searchResult[index]);
                                }),
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 17.v),
                ]))));
  }

/*
  Widget _buildListCategoryButton() {
    // ScrollController _controller = new ScrollController();
    //categoriesController.getCategories();
    return Obx(() => Container(
          width: 300.h,
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
              //controller: _controller,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                  categoriesController
                      .allCategory.length, //   .allCategory!.length,
                  (index) {
                return _buildButtonCategory(
                  categoriesController.allCategory[index],
                );
              })),
        ));
  }
*/
  void SearchContent(int categoryId, String searchText) {
    controller.SearchNews(categoryId, searchText);
  }

  Widget _buildButtonCategory(Category category) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: appTheme.gray600),
      child: Text(category.category.toString(),
          style: TextStyle(
            fontSize: 10,
            color: appTheme.blueGray50,
          )),
      onPressed: () {
        //Navigator.pop(context);
        // newsperCategoryController.getNewsPerCategories(category.id);
        // Get.to(() => PageSearchCategory(), arguments: [
        //   {"idcategory": category.id}
        // ]);

        selectedCategory = category.id!;

        print(category.category.toString());
      },
    );
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

/*
  Widget _buildListSearchResult() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:
                List.generate(controller.allNewsPerCategory.length, (index) {
              return _buildCardNewsColumn(controller.allNewsPerCategory[index]);
            })));
  }
*/
  Widget _buildCardNewsColumn(ContentSearchResult theNews) {
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
                        Text(theNews.datePublish.toString(),
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
                          child: CustomImageView(
                              imagePath: theNews.header.toString(),
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
    Get.toNamed(AppRoutes.newsOneScreen);

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

  Widget _chipsCategory(ChipsCategory chipcategory) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 2.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipcategory.category.toString(),
        style: TextStyle(
          color: (chipcategory.selected! ?? false)
              ? appTheme.whiteA700
              : appTheme.green900,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (chipcategory.selected! ?? false),
      backgroundColor: appTheme.green7007f,
      selectedColor: theme.colorScheme.onError,
      shape: (chipcategory.selected! ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                9.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                9.h,
              ),
            ),
      onSelected: (value) {
        chipcategory.selected = value;
      },
      onPressed: () {
        /*
        Get.to(() => PageSearchCategory(), arguments: [
          {"idcategory": chipcategory.id}
        ]);
        */
      },
    );
  }
}
