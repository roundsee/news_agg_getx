//import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/controllers/news_per_cagory_controller.dart';
import 'package:new_agg/core/models/category.dart';
//import 'package:new_agg/presentation/home_page/widgets/side_drawer.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/webview.dart';
import 'package:new_agg/presentation/news_one_screen/news_one_screen.dart';
import 'package:new_agg/presentation/page_search_category/page_search_category.dart';
//import 'package:new_agg/widgets/custom_elevated_button.dart';
//import 'package:new_agg/widgets/custom_icon_button.dart';
//import 'package:toggle_switch/toggle_switch.dart';
import 'controller/home_page_with_tab_controller.dart';
import 'models/home_page_with_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
//import 'package:new_agg/presentation/home_page/home_page.dart';
import 'package:new_agg/core/models/content_per_category.dart';
//import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
//import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_search_view.dart';
//import 'package:new_agg/core/models/content_per_category.dart';

// ignore_for_file: must_be_immutable
class HomePageWithTabPage extends GetView {
  HomePageWithTabPage({Key? key}) : super(key: key);

  HomePageWithTabController controller = Get.put(HomePageWithTabController());
  CategoriesController categoriesController = Get.put(CategoriesController());

  NewsPerCategoryController newsperCategoryController =
      Get.put(NewsPerCategoryController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: appTheme.whiteA700,
                //leadingWidth: 47.h,
                // leading: AppbarLeadingImage(
                //   imagePath: ImageConstant.imgCharmMenuHamburger,
                //  margin:
                //       EdgeInsets.only(left: 23.h, top: 14.v, bottom: 14.v)),
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
            //_builTabBar(),
            drawer: Drawer(
              backgroundColor: appTheme.gray100,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      child: Text("Category"),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      )),
                  GetBuilder<CategoriesController>(
                    builder: (controller) {
                      return Container(
                        decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              categoriesController.allCategory.length, (index) {
                            return ListTile(
                              leading: ImageIcon(NetworkImage(
                                  categoriesController.allCategory[index].icon
                                      .toString())),
                              title: Text(categoriesController
                                  .allCategory[index].category
                                  .toString()),
                              onTap: () {
                                Navigator.pop(context);
                                newsperCategoryController.getNewsPerCategories(
                                    categoriesController.allCategory[index].id);
                                Get.to(() => PageSearchCategory(), arguments: [
                                  {
                                    "idcategory": categoriesController
                                        .allCategory[index].id
                                  }
                                ]);
                              },
                            );
                            //Text(categoriesController.allCategory[index].category.toString());
                          }),
                        ),
                      );
                    },
                    init: CategoriesController(),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 5.v),
                Padding(
                    padding: EdgeInsets.only(left: 25.h, right: 24.h),
                    child: CustomSearchView(
                        controller: controller.searchController,
                        hintText: "lbl_search".tr)),
                SizedBox(height: 5.v),
                Container(height: 25, child: _buildListCategoryButton()),
                SizedBox(height: 5.v),
                Container(
                  height: 425.v,
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text("msg_recommend_for_you".tr,
                                  style:
                                      CustomTextStyles.titleSmallBlack900Bold)),
                          GestureDetector(
                            child: Text("lbl_see_all".tr,
                                style: theme.textTheme.bodyMedium),
                            onTap: () => {
                              //onTapSeeAllRecommended()
                              onTapSeeAllNew()
                            },
                          )
                        ]),
                    SizedBox(height: 10.v),
                    _buildCarousel(),
                    //_buildListNewNews(),
                    SizedBox(height: 17.v),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10.v),
                              child: Text("msg_recommend_for_you".tr,
                                  style:
                                      CustomTextStyles.titleSmallBlack900Bold)),
                          GestureDetector(
                            child: Text("lbl_see_all".tr,
                                style: theme.textTheme.bodyMedium),
                            onTap: () => {
                              //onTapSeeAllRecommended()
                              onTapSeeAllRecommended()
                            },
                          )
                        ]),
                    SizedBox(height: 10.v),
                    _buildListRecommended(),
                    // _buildFrame(),
                    /*
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
                                    */
                  ])),
                ),
              ],
            )));
  }

  void CategoryFilter(int idcategory) {
    newsperCategoryController.getNewsPerCategories(idcategory);
  }

/*
  Widget categoryListButtons() {
    return Row(
      children: List.generate(categoriesController.allCategory.length, (index) {
        return CustomIconButton(
          child:
              Text(categoriesController.allCategory[index].category.toString()),
          category: categoriesController.allCategory[index].category.toString(),
          onTap: () {
              //newsperCategoryController.getNewsPerCategories(idcategory);
            //Get.off(PageSearchCategory());
          },
        );
        //Text(categoriesController.allCategory[index].category.toString());
      }),
    );
  }
*/
/*
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
*/
  Widget _buildCarousel() {
    return Obx(
      () => CarouselSlider(
        options: CarouselOptions(
            height: 200, autoPlay: false, enlargeCenterPage: true),
        items: controller.listContent?.value.map((instance) {
          return controller.categoryNotFound.value
              ? const Center(
                  child: Text("Not Found", style: TextStyle(fontSize: 30)))
              : controller.listContent!.value.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Builder(builder: (BuildContext context) {
                      try {
                        return Banner(
                          location: BannerLocation.topStart,
                          message: 'Hot News',
                          child: InkWell(
                            onTap: () =>
                                Get.to(() => NewsOneScreen(), arguments: [
                              {"id": instance.id.toString()}
                            ]),
                            //() => Get.to(() => WebViewNews(
                            //  newsUrl: instance.source.toString())),
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomImageView(
                                  imagePath: instance.header.toString(),
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0),
                                              Colors.black
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              instance.category.toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                  )),
                            ]),
                          ),
                        );
                      } catch (e) {
                        //if (kDebugMode) {
                        print(e);
                        // }
                        return Container();
                      }
                    });
        }).toList(),
      ),
    );
  }

/*
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
                  labelColor: appTheme.gray200,
                  labelStyle: TextStyle(
                      fontSize: 10.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400),
                  unselectedLabelColor: appTheme.gray400,
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
*/
  Widget _buildListNewNews() {
    ScrollController _controller = new ScrollController();
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Obx(() => Container(
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(), // new
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: List.generate(controller.listContent!.value.length,
                      (index) {
                    return _buildCardNewNews(
                        controller.listContent!.value[index]);
                  })),
            )));
  }

// Generate Rrecommended List
  Widget _buildListRecommended() {
    ScrollController _controller = new ScrollController();
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Obx(() => Container(
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(), // new
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                      controller.listRecommended!.value.length, (index) {
                    return _buildCardRecommended(
                        controller.listRecommended!.value[index]);
                  })),
            )));
  }

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
                    categoriesController.allCategory[index]);
              })),
        ));
  }

  Widget _buildButtonCategory(Category category) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: appTheme.gray600),
        child: Text(category.category.toString(),
            style: TextStyle(
              fontSize: 10,
              color: appTheme.blueGray50,
            )),
        onPressed: () {
          //Navigator.pop(context);
          newsperCategoryController.getNewsPerCategories(category.id);
          controller.getAllRecommendedFromApi();

          // Get.to(() => PageSearchCategory(), arguments: [
          //   {"idcategory": category.id}
          // ]);
          print(category.category.toString());
        },
      ),
    );
  }

/*
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
        Get.to(() => PageSearchCategory(), arguments: [
          {"idcategory": chipcategory.id}
        ]);
      },
    );
  }
*/
  Widget _buildCardNewNews(Content theNews) {
    return GestureDetector(
        onTap: () {
          onTapCardNewsColumn(theNews.id.toString());
        },
        child: Container(
            height: 110,
            margin: EdgeInsets.only(left: 15.h, right: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 10.v),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
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
                width: 250.h,
                margin: EdgeInsets.only(right: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: AppDecoration.fillBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          width: 75,
                          height: 75,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(5), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(30), // Image radius
                              child: CustomImageView(
                                  imagePath: theNews.header.toString()),
                            ),
                          )),
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
                                style: theme.textTheme.labelSmall),
                          ]),
                        ]),
                      ),
                    ]),
              ),
              SizedBox(height: 6.v)
            ])));
  }

  // Genearte Recommended Card
  Widget _buildCardRecommended(Content theNews) {
    return GestureDetector(
        onTap: () {
          onTapCardNewsColumn(theNews.id.toString());
        },
        child: Container(
            height: 110,
            margin: EdgeInsets.only(left: 15.h, right: 15.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 10.v),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
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
                width: 250.h,
                margin: EdgeInsets.only(right: 2.h),
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: AppDecoration.fillBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          width: 75,
                          height: 75,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(5), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(30), // Image radius
                              child: CustomImageView(
                                  imagePath: theNews.header.toString()),
                            ),
                          )),
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
                                style: theme.textTheme.labelSmall),
                          ]),
                        ]),
                      ),
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
    Get.to(() => NewsOneScreen(), arguments: [
      {"id": idnews}
    ]);
  }

  onTapButtonCategory(var idcategory) {
    //newsperCategoryController.getNewsPerCategories(idcategory);

    Get.to(() => PageSearchCategory(), arguments: [
      {"idcategory": idcategory}
    ]);
  }

  onTapSeeAllRecommended() {
    Get.toNamed(AppRoutes.pageRecommendedList, arguments: [
      {
        "id": 2,
        "arg": 10, // 10 items perr page
        "arg2": 1
      } // page 1
    ]);
  }

  onTapSeeAllNew() {
    Get.toNamed(AppRoutes.pageRecommendedList, arguments: [
      {
        "id": 1,
        "arg": 10, // 10 items perr page
        "arg2": 1
      } // page 1
    ]);
  }

  onTapSeeAllTrend() {
    Get.toNamed(AppRoutes.pageRecommendedList, arguments: [
      {
        "id": 3,
        "arg": 10, // 10 items perr page
        "arg2": 1
      } // page 1
    ]);
  }

  onTapSeeAllSuggest() {
    Get.toNamed(AppRoutes.pageRecommendedList, arguments: [
      {
        "id": 4,
        "arg": 10, // 10 items perr page
        "arg2": 1
      } // page 1
    ]);
  }
/*
  Widget _buildListTending() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Obx(() => Container(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(controller.listRecommended!.length,
                      (index) {
                    return _buildCardRecommended(
                        controller.listRecommended![index]);
                  })),
            )));
  }
*/

  /// Navigates to the notificationScreen when the action is triggered.
  onTapMdiBellNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

//==============================
/*
  Widget _builTabBar() {
    return DefaultTabController(
      length: categoriesController.allCategory.length,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: Colors.red,
            unselectedBackgroundColor: Colors.grey[300],
            unselectedLabelStyle: TextStyle(color: Colors.black),
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            tabs: List.generate(categoriesController.allCategory!.length,
                (index) {
              return _buildCategoryTab(
                  categoriesController.allCategory![index]);
            }),
/*                  [

              Tab(
                icon: Icon(Icons.directions_car),
                text: "car",
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: "transit",
              ),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]*/
          ),
          Expanded(
            child: TabBarView(
              children: List.generate(categoriesController.allCategory!.length,
                  (index) {
                return _buildCategoryTabPage(
                    categoriesController.allCategory![index]);
              })
              /*
              <Widget>[
                Center(
                  child: Icon(Icons.directions_car),
                ),
                Center(
                  child: Icon(Icons.directions_transit),
                ),
                Center(
                  child: Icon(Icons.directions_bike),
                ),
                Center(
                  child: Icon(Icons.directions_car),
                ),
                Center(
                  child: Icon(Icons.directions_transit),
                ),
                Center(
                  child: Icon(Icons.directions_bike),
                ),
              ]
              */
              ,
            ),
          ),
        ],
      ),
    );
  }
*/
/*
  Widget _buildCategoryTab(Category theCategory) {
    return Tab(
      icon: new Image.network(theCategory.icon.toString()),
      text: theCategory.category.toString(),
    );
    /*
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),;
              */
  }

  Widget _buildCategoryTabPage(Category theCategory) {
    return SingleChildScrollView(
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
                      newsperCategoryController.allNewsPerCategory
                          .length, // .allNewsPerCategory.value.length,
                      (index) {
                    return _buildCardNewsColumn(
                        newsperCategoryController.allNewsPerCategory[index]);
                  }),
                ),
              ),
            )
          ]),
    );
//==============================
  }
*/
/*
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
  */
}
