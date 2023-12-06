import '../alternative_home_page_design_one_screen/widgets/alternativehomepagedesignonegrid_item_widget.dart';
import '../alternative_home_page_design_one_screen/widgets/politiklist_item_widget.dart';
import '../alternative_home_page_design_one_screen/widgets/rumahsakitdigazalist_item_widget.dart';
import 'controller/alternative_home_page_design_one_controller.dart';
import 'models/alternativehomepagedesignonegrid_item_model.dart';
import 'models/politiklist_item_model.dart';
import 'models/rumahsakitdigazalist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_search_view.dart';

class AlternativeHomePageDesignOneScreen
    extends GetWidget<AlternativeHomePageDesignOneController> {
  const AlternativeHomePageDesignOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 13.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(left: 25.h, right: 24.h),
                      child: CustomSearchView(
                          controller: controller.searchController,
                          hintText: "lbl_search".tr)),
                  SizedBox(height: 17.v),
                  _buildSportsHorizontalScroll(),
                  SizedBox(height: 25.v),
                  _buildNewNewsRow(),
                  SizedBox(height: 9.v),
                  _buildCardNewsColumn(),
                  SizedBox(height: 20.v),
                  _buildRecommendForYouRow(),
                  SizedBox(height: 8.v),
                  _buildRumahSakitDiGazaList(),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 26.h),
                          child: Text("lbl_pemilu_2024".tr,
                              style: CustomTextStyles.titleSmallBlack900Bold))),
                  SizedBox(height: 10.v),
                  _buildAlternativeHomePageDesignOneGrid(),
                  SizedBox(height: 10.v),
                  _buildPolitikColumn(),
                  _buildPolitikList()
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
  Widget _buildSportsHorizontalScroll() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_sports".tr,
                  style: CustomTextStyles.bodySmallWhiteA700)),
          Container(
              width: 54.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillIndigo
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_politics".tr,
                  style: CustomTextStyles.bodySmallWhiteA700)),
          Container(
              width: 72.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_economics".tr,
                  style: CustomTextStyles.bodySmallWhiteA700)),
          Container(
              width: 53.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_school".tr,
                  style: CustomTextStyles.bodySmallWhiteA700)),
          Container(
              width: 57.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 2.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_healthy".tr,
                  style: CustomTextStyles.bodySmallWhiteA700)),
          Container(
              width: 52.h,
              margin: EdgeInsets.only(left: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.v),
              decoration: AppDecoration.fillGray400
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Text("lbl_sports".tr,
                  style: CustomTextStyles.bodySmallWhiteA700))
        ])));
  }

  /// Section Widget
  Widget _buildNewNewsRow() {
    return Padding(
        padding: EdgeInsets.only(left: 28.h, right: 24.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_new_news".tr, style: CustomTextStyles.titleSmallBold),
          Text("lbl_see_all".tr, style: theme.textTheme.bodyMedium)
        ]));
  }

  /// Section Widget
  Widget _buildCardNewsColumn() {
    return GestureDetector(
        onTap: () {
          onTapCardNewsColumn();
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
                          image: AssetImage(ImageConstant.imgFrame40),
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
                      margin: EdgeInsets.only(right: 45.h),
                      child: Text("msg_elon_musk_memaksa".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge))),
              SizedBox(height: 3.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 179.h,
                              child: Text("msg_aksi_boykot_masal".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall)),
                          SizedBox(height: 20.v),
                          Text("lbl_4_jam_yang_lalu".tr,
                              style: CustomTextStyles.bodySmallGray600)
                        ]),
                    Padding(
                        padding: EdgeInsets.only(left: 26.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgSolarHeartBold,
                            userLabel: "lbl_100".tr)),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgPhBookmarkSimpleFill,
                            userLabel: "lbl_100".tr)),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h, top: 20.v),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgMajesticonsShareCircle,
                            userLabel: "lbl_100".tr))
                  ]),
              SizedBox(height: 6.v)
            ])));
  }

  /// Section Widget
  Widget _buildRecommendForYouRow() {
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
  Widget _buildRumahSakitDiGazaList() {
    return Padding(
        padding: EdgeInsets.only(left: 26.h, right: 23.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: controller.alternativeHomePageDesignOneModelObj.value
                .rumahsakitdigazalistItemList.value.length,
            itemBuilder: (context, index) {
              RumahsakitdigazalistItemModel model = controller
                  .alternativeHomePageDesignOneModelObj
                  .value
                  .rumahsakitdigazalistItemList
                  .value[index];
              return RumahsakitdigazalistItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildAlternativeHomePageDesignOneGrid() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 200.v,
            crossAxisCount: 3,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.alternativeHomePageDesignOneModelObj.value
            .alternativehomepagedesignonegridItemList.value.length,
        itemBuilder: (context, index) {
          AlternativehomepagedesignonegridItemModel model = controller
              .alternativeHomePageDesignOneModelObj
              .value
              .alternativehomepagedesignonegridItemList
              .value[index];
          return AlternativehomepagedesignonegridItemWidget(model);
        }));
  }

  /// Section Widget
  Widget _buildPolitikColumn() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 637.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  color: theme.colorScheme.onPrimaryContainer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Container(
                      height: 75.v,
                      width: 287.h,
                      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: EdgeInsets.only(top: 8.v, right: 6.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.h, vertical: 4.v),
                                decoration: AppDecoration.fillGray700021
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder5),
                                child: Text("lbl_politik".tr,
                                    style: CustomTextStyles
                                        .bodySmallWhiteA700_1))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ImageConstant.imgFrame41),
                                        fit: BoxFit.cover)),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 35.v),
                                      Container(
                                          width: 33.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.h, vertical: 4.v),
                                          decoration: AppDecoration
                                              .fillGray70002
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder5),
                                          child: Text("lbl_politik".tr,
                                              style: CustomTextStyles
                                                  .bodySmallWhiteA700_1))
                                    ])))
                      ]))),
              SizedBox(height: 11.v),
              Text("msg_britania_raya_resmi".tr,
                  style: theme.textTheme.labelLarge)
            ]));
  }

  /// Section Widget
  Widget _buildPolitikList() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 20.h, right: 24.h),
            child: Obx(() => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.v);
                },
                itemCount: controller.alternativeHomePageDesignOneModelObj.value
                    .politiklistItemList.value.length,
                itemBuilder: (context, index) {
                  PolitiklistItemModel model = controller
                      .alternativeHomePageDesignOneModelObj
                      .value
                      .politiklistItemList
                      .value[index];
                  return PolitiklistItemWidget(model);
                }))));
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

  /// Navigates to the notificationScreen when the action is triggered.
  onTapMdiBellNotification() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapCardNewsColumn() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
