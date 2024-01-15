import '../news_one_screen/widgets/newsonelist_item_widget.dart';
import 'controller/news_one_controller.dart';
import 'models/newsonelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

class NewsOneScreen extends GetView<NewsOneController> {
  NewsOneScreen({Key? key}) : super(key: key);

//NewsOneController Detailcontroller = Get.put(NewsOneController());
  @override
  Widget build(BuildContext context) {
    Get.put(NewsOneController());
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 19.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 238.h,
                                  margin: EdgeInsets.only(left: 28.h),
                                  child: Obx(
                                    () => Text(
                                        controller.title.value.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleMediumInterSemiBold),
                                  )),
                              SizedBox(height: 7.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 30.h),
                                  child: Text("Ini nampilin apa ya ?",
                                      style: CustomTextStyles
                                          .titleSmallBluegray900)),
                              SizedBox(height: 8.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 28.h),
                                  child: Obx(() => Text(
                                      "Author:" +
                                          controller.author.value.toString() +
                                          ", " +
                                          controller.publish.value.toString(),
                                      style: CustomTextStyles
                                          .bodySmallGray70002))),
                              SizedBox(height: 5.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 307.h,
                                      margin: EdgeInsets.only(
                                          left: 25.h, right: 28.h),
                                      child: Obx(() => Text(
                                          controller.description.value
                                              .toString(),
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .labelLargeMedium)))),
                              SizedBox(height: 14.v),
                              _buildOneStack(),
                              SizedBox(height: 14.v),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 307.h,
                                      margin: EdgeInsets.only(
                                          left: 25.h, right: 28.h),
                                      child: Text(
                                          "lanjutan...." +
                                              controller.description.value
                                                  .toString(),
                                          maxLines: 26,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .labelLargeMedium))),
                              SizedBox(height: 17.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 25.h),
                                  child: Obx(() => Row(children: [
                                        GestureDetector(
                                          child: _buildFrameThirtySeven(
                                              bookmarkImage: controller.like ==
                                                      "1"
                                                  ? ImageConstant
                                                      .imgSolarHeartBoldRed70001
                                                  : ImageConstant
                                                      .imgSolarHeartBold,
                                              bookmarkLabel: controller
                                                  .jlike.value
                                                  .toString()),
                                          onTap: () {
                                            controller.InteractionClick(
                                                controller.idn, 1);
                                          },
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: GestureDetector(
                                              child: _buildFrameThirtySeven(
                                                  bookmarkImage: controller
                                                              .save ==
                                                          "1"
                                                      ? ImageConstant
                                                          .imgPhBookmarkSimpleFillOnerror
                                                      : ImageConstant
                                                          .imgPhBookmarkSimpleFill,
                                                  bookmarkLabel: controller
                                                      .jsave.value
                                                      .toString()),
                                              onTap: () {
                                                controller.InteractionClick(
                                                    controller.idn, 2);
                                              },
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: _buildFrameThirtySeven(
                                                bookmarkImage: ImageConstant
                                                    .imgMajesticonsShareCircle,
                                                bookmarkLabel: controller
                                                    .jshare.value
                                                    .toString()))
                                      ]))),
                              SizedBox(height: 19.v),
/*
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.h, right: 28.h),
                                  child: CustomTextFormField(
                                      controller:
                                          controller.frameFiftyNineController,
                                      hintText: "msg_tambahkan_komentar".tr,
                                      hintStyle:
                                          CustomTextStyles.bodySmallGray60003,
                                      textInputAction: TextInputAction.done,
                                      alignment: Alignment.center,
                                      borderDecoration:
                                          TextFormFieldStyleHelper.fillBlueGray,
                                      fillColor: appTheme.blueGray100)),
                              SizedBox(height: 16.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.h, right: 28.h),
                                  child: _buildFrameSixtySix(
                                      userName: "lbl_ronsi".tr,
                                      hCounter: "lbl_6_h".tr,
                                      apakahTidakMasalah:
                                          "msg_apakah_tidak_masalah".tr,
                                      wpfLike: ImageConstant.imgWpfLike,
                                      likesCounter: "lbl_40_likes".tr,
                                      reply: "lbl_reply".tr,
                                      viewMoreReplies:
                                          "msg_view_more_54_replies".tr)),
                              SizedBox(height: 17.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.h, right: 28.h),
                                  child: _buildFrameSixtySix(
                                      userName: "lbl_ronsi".tr,
                                      hCounter: "lbl_6_h".tr,
                                      apakahTidakMasalah:
                                          "msg_apakah_tidak_masalah".tr,
                                      wpfLike: ImageConstant.imgWpfLikeGray900,
                                      likesCounter: "lbl_40_likes".tr,
                                      reply: "lbl_reply".tr,
                                      viewMoreReplies:
                                          "msg_view_more_54_replies".tr)),
*/
                              SizedBox(height: 31.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Text("lbl_berita_serupa".tr,
                                      style: theme.textTheme.labelLarge)),
                              SizedBox(height: 8.v),
                              _buildNewsOneList()
                            ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 14.v, bottom: 14.v),
            onTap: () {
              onTapArrowLeft();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMdiSortAlphabeticalVariant,
              margin: EdgeInsets.only(left: 25.h, top: 14.v, right: 14.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPhTranslateFill,
              margin: EdgeInsets.only(left: 16.h, top: 14.v, right: 39.h))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildOneStack() {
    return Obx(() => Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 223.v,
            width: 307.h,
            child: Stack(alignment: Alignment.centerLeft, children: [
              CustomImageView(
                  imagePath: controller.imgUrl.value == ""
                      ? ImageConstant.imgRectangle8223x307
                      : controller.imgUrl.value,
                  height: 223.v,
                  width: 307.h,
                  alignment: Alignment.center),
              /*
              CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 43.adaptSize,
                  width: 43.adaptSize,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 125.h))
                  */
            ]))));
  }

  /// Section Widget
  Widget _buildNewsOneList() {
    return SizedBox(
        height: 199.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.h);
            },
            itemCount: controller
                .newsOneModelObj.value.newsonelistItemList.value.length,
            itemBuilder: (context, index) {
              NewsonelistItemModel model = controller
                  .newsOneModelObj.value.newsonelistItemList.value[index];
              return NewsonelistItemWidget(model);
            })));
  }

  /// Common widget
  Widget _buildFrameThirtySeven({
    required String bookmarkImage,
    required String bookmarkLabel,
  }) {
    return Column(children: [
      CustomImageView(
          imagePath: bookmarkImage, height: 20.adaptSize, width: 20.adaptSize),
      SizedBox(height: 3.v),
      Text(bookmarkLabel,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Common widget
  Widget _buildFrameSixtySix({
    required String userName,
    required String hCounter,
    required String apakahTidakMasalah,
    required String wpfLike,
    required String likesCounter,
    required String reply,
    required String viewMoreReplies,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse3,
              height: 32.adaptSize,
              width: 32.adaptSize,
              radius: BorderRadius.circular(16.h),
              margin: EdgeInsets.only(bottom: 62.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(userName,
                              style: theme.textTheme.labelMedium!
                                  .copyWith(color: appTheme.black900)),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(hCounter,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(color: appTheme.blueGray40001)))
                        ]),
                        SizedBox(height: 9.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                      width: 216.h,
                                      child: Text(apakahTidakMasalah,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles.bodySmall10
                                              .copyWith(
                                                  color: appTheme.black900)))),
                              CustomImageView(
                                  imagePath: wpfLike,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin:
                                      EdgeInsets.only(left: 27.h, bottom: 6.v))
                            ]),
                        SizedBox(height: 10.v),
                        Row(children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text(likesCounter,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(
                                          color: appTheme.blueGray40001))),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text(reply,
                                  style: CustomTextStyles.bodySmallBluegray40001
                                      .copyWith(color: appTheme.blueGray40001)))
                        ]),
                        SizedBox(height: 8.v),
                        Text(viewMoreReplies,
                            style: CustomTextStyles.bodySmallBluegray40001
                                .copyWith(color: appTheme.blueGray40001))
                      ])))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
