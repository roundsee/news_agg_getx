import 'package:new_agg/core/controllers/categories_controller.dart';
import 'package:new_agg/core/models/category.dart';

import 'package:new_agg/presentation/news_one_screen/news_one_screen.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/custom_search_view.dart';

import 'controller/new_trending_controller.dart';

import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class NewTrendingPage extends StatelessWidget {
  NewTrendingPage({Key? key}) : super(key: key);

  NewTrendingController controller = Get.put(NewTrendingController());
  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
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
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 25.v),
                    Padding(
                        padding: EdgeInsets.only(left: 25.h, right: 24.h),
                        child: CustomSearchView(
                            controller: controller.searchController,
                            hintText: "lbl_search".tr)),
                    SizedBox(height: 5.v),
                    Container(height: 25, child: _buildListCategoryButton()),
                    SizedBox(height: 5.v),
                    _buildListTrending()
                  ]),
                ))));
  }

  /// Section Widget
  /*
  Widget _buildHistoryPage() {
    controller.getNewsHistory();
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Obx(() => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12.v);
                },
                itemCount: controller.listHistory.length,
                //.historyModelObj.value.historypageItemList.value.length,
                itemBuilder: (context, index) {
                  Content model = controller.listHistory[index];
                  //   .historyModelObj.value.historypageItemList.value[index];
                  return HistorypageItemWidget(model, onTapCardNews: () {
                    onTapCardNews();
                  });
                }))));
  }
*/
// ==============
  Widget _buildListTrending() {
    ScrollController _controller = new ScrollController();
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Obx(
          () => Container(
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(), // new
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children:
                      List.generate(controller.listTrending!.length, (index) {
                    return _buildCardTrending(controller.listTrending[index]);
                  }))),
        ));
  }

  Widget _buildCardTrending(itemHistory) {
    return GestureDetector(
      onTap: () {
        onTapCardNews!.call(itemHistory.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 10.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 287.h,
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 8.v,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder5,
                image: DecorationImage(
                  image: NetworkImage(itemHistory.header.toString()
                      //ImageConstant.imgFrame40,
                      ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 39.v),
                  Container(
                    width: 33.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillGray70002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child:
                        //Obx(
                        //  () =>
                        Text(
                      itemHistory.category.toString(),
                      style: CustomTextStyles.bodySmallWhiteA700_1,
                    ),
                    //),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 242.h,
                margin: EdgeInsets.only(right: 46.h),
                child:
                    //Obx(() =>
                    Text(
                  itemHistory.title.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge,
                  //),
                ),
              ),
            ),
            SizedBox(height: 4.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 179.h,
                      child:
                          //Obx(() =>
                          Text(
                        "Ini apa ya?",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                      //),
                    ),
                    SizedBox(height: 20.v),
//                    Obx(() =>
                    Text(
                      itemHistory.publish.toString(),
                      style: CustomTextStyles.bodySmallGray600,
                    ),
                    //                  ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 27.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgSolarHeartBold,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
                      //Obx(() =>
                      Text(
                        "jlike",
                        style: theme.textTheme.bodySmall,
                      ),
                      //),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: itemHistory
                            .header, // ImageConstant.imgPhBookmarkSimpleFill,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
                      //Obx(() =>
                      Text(
                        "jsave",
                        style: theme.textTheme.bodySmall,
                      ),
                      //),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 20.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMajesticonsShareCircle,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                      ),
                      SizedBox(height: 3.v),
//                      Obx(() =>
                      Text(
                        "jshare",
                        style: theme.textTheme.bodySmall,
                      ),
                      //),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.v),
          ],
        ),
      ),
    );
  }

// ===================
  /// Navigates to the newsScreen when the action is triggered.
  onTapCardNews(var idnews) {
    Get.to(() => NewsOneScreen(), arguments: [
      {"id": idnews}
    ]);
    //Get.toNamed(
    //  AppRoutes.newsScreen,
    // );
  }

  void onTapMdiBellNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
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
          //controller.getNewsHistory();
          //controller.getAllRecommendedFromApi();

          // Get.to(() => PageSearchCategory(), arguments: [
          //   {"idcategory": category.id}
          // ]);
          print(category.category.toString());
        },
      ),
    );
  }
}
