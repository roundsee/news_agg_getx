import 'widgets/selected_item_widget.dart';
import 'widgets/generalnews_item_widget.dart';
import 'widgets/recommended_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/selectednews_item_model.dart';
import 'models/home_model.dart';
import 'models/generalnews_item_model.dart';
import 'models/recommended_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 25.v),
                  Column(children: [
                    _buildNewsSection(),
                    SizedBox(height: 9.v),
                    _buildCardNewsSection(),
                    SizedBox(height: 20.v),
                    _buildRecommendationSection(),
                    SizedBox(height: 8.v),
                    _RecommendedSection(),
                    SizedBox(height: 20.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 26.h),
                            child: Text("lbl_pemilu_2024".tr,
                                style:
                                    CustomTextStyles.titleSmallBlack900Bold))),
                    SizedBox(height: 11.v),
                    _buildSelectedNewsSection(),
                    SizedBox(height: 10.v),
                    _buildGeneralNewsSection(),
                  ])
                ])))));
  }

  /// Section Widget
  Widget _buildNewsSection() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 23.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_new_news".tr, style: CustomTextStyles.titleSmallBold),
          Text("lbl_see_all".tr, style: theme.textTheme.bodyMedium)
        ]));
  }

  /// Section Widget
  Widget _buildCardNewsSection() {
    String imageUrl = "https://dimensy.id/assets/images/about/about-us1.jpg";
    String id = "id";
    String url = "";
    String publishAt = "hari ini";
    String strCategory = " Category";
    String description = "Description";
    String strSlug = "hdhdhksjdks aksd akd";
    String title = "Title";
    int jLike = 1;
    int jSave = 2;
    int jShare = 3;
    int isLike = 1;
    int isSave = 1;
    return GestureDetector(
        onTap: () {
          onTapCardNewsSection();
        },
        child: Container(
            margin: EdgeInsets.only(left: 28.h, right: 21.h),
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 10.v),
            decoration: AppDecoration.fillBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 287.h,
                  margin: EdgeInsets.only(right: 2.h),
                  padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.v),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                      image: DecorationImage(
                          image: NetworkImage(
                              imageUrl), // AssetImage(ImageConstant.imgFrame40),
                          fit: BoxFit.cover)),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 39.v),
                        Container(
                            width: 33.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.h, vertical: 4.v),
                            decoration: AppDecoration.fillGray70002.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5),
                            child: Text("lbl_politik".tr,
                                style: CustomTextStyles.bodySmallWhiteA700_1))
                      ])),
              SizedBox(height: 9.v),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 242.h,
                      margin: EdgeInsets.only(right: 46.h),
                      child: Text(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge))),
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
                              child: Text(description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall)),
                          SizedBox(height: 20.v),
                          Text(publishAt,
                              style: CustomTextStyles.bodySmallGray600)
                        ]),
                    Padding(
                        padding: EdgeInsets.only(left: 27.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgSolarHeartBold,
                            userLabel: jLike.toString())),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgPhBookmarkSimpleFill,
                            userLabel: jSave.toString())),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgMajesticonsShareCircle,
                            userLabel: jShare.toString()))
                  ]),
              SizedBox(height: 7.v)
            ])));
  }

  /// Section Widget
  Widget _buildRecommendationSection() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 23.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("msg_recommend_for_you".tr,
                  style: CustomTextStyles.titleSmallBlack900Bold)),
          Text("lbl_see_all".tr, style: theme.textTheme.bodyMedium)
        ]));
  }

  /// Section Widget
  Widget _RecommendedSection() {
    return Padding(
        padding: EdgeInsets.only(left: 26.h, right: 23.h),
        child: Obx(() => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount:
                controller.homeModelObj.value.recommendedItemList.value.length,
            itemBuilder: (context, index) {
              RecommendedItemModel model = controller
                  .homeModelObj.value.recommendedItemList.value[index];
              return RecommendedItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildSelectedNewsSection() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150.v,
            crossAxisCount: 3,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h),
        physics: BouncingScrollPhysics(),
        itemCount:
            controller.homeModelObj.value.selectedNewsItemList.value.length,
        itemBuilder: (context, index) {
          SelectedNewsItemModel model =
              controller.homeModelObj.value.selectedNewsItemList.value[index];
          return SelectedNewsItemWidget(model);
        }));
  }

  /// Section Widget
  Widget _buildGeneralNewsSection() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Obx(() => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount:
                controller.homeModelObj.value.generalNewsItemList.value.length,
            itemBuilder: (context, index) {
              GeneralNewsItemModel model = controller
                  .homeModelObj.value.generalNewsItemList.value[index];
              return GeneralNewsItemWidget(model);
            })));
  }

  /// Common widget
  Widget _buildFrameThirtySeven({
    required String userImage,
    required String userLabel,
  }) {
    return Column(children: [
      CustomImageView(
          imagePath: userImage, height: 20.adaptSize, width: 20.adaptSize),
      SizedBox(height: 3.v),
      Text(userLabel,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapCardNewsSection() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
