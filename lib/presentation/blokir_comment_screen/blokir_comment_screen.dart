import '../blokir_comment_screen/widgets/blokircomment_item_widget.dart';
import 'controller/blokir_comment_controller.dart';
import 'models/blokircomment_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_title.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';

class BlokirCommentScreen extends GetWidget<BlokirCommentController> {
  const BlokirCommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 19.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 238.h,
                              margin: EdgeInsets.only(left: 28.h),
                              child: Text("msg_elon_musk_memaksa2".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .titleMediumInterSemiBold)),
                          SizedBox(height: 7.v),
                          Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Text("msg_lorem_ipsum_dolor".tr,
                                  style:
                                      CustomTextStyles.titleSmallBluegray900)),
                          SizedBox(height: 8.v),
                          Padding(
                              padding: EdgeInsets.only(left: 28.h),
                              child: Text("msg_author_remar".tr,
                                  style: CustomTextStyles.bodySmallGray70002)),
                          SizedBox(height: 5.v),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 307.h,
                                  margin:
                                      EdgeInsets.only(left: 25.h, right: 28.h),
                                  child: Text("msg_lorem_ipsum_dolor2".tr,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          CustomTextStyles.labelLargeMedium))),
                          SizedBox(height: 14.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRectangle8,
                              height: 223.v,
                              width: 307.h,
                              alignment: Alignment.center),
                          SizedBox(height: 14.v),
                          SizedBox(
                              height: 981.v,
                              width: double.maxFinite,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    _buildSolarHeartBold(),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: SizedBox(
                                            width: 307.h,
                                            child: Text(
                                                "msg_lorem_ipsum_dolor3".tr,
                                                maxLines: 26,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .labelLargeMedium))),
                                    _buildBeritaSerupa(),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 37.v),
                                            decoration: AppDecoration
                                                .outlineBlack900
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .customBorderTL10),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _buildAppBar1(),
                                                  SizedBox(height: 36.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25.h),
                                                      child: Text(
                                                          "msg_laporkan_komentar"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleMediumInterMedium)),
                                                  SizedBox(height: 9.v),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          "msg_mengapa_anda_melaporkan"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallPoppinsBlack900)),
                                                  SizedBox(height: 9.v),
                                                  Container(
                                                      width: 281.h,
                                                      margin: EdgeInsets.only(
                                                          left: 25.h,
                                                          right: 53.h),
                                                      child: Text(
                                                          "msg_laporan_harus_disampaikan"
                                                              .tr,
                                                          maxLines: 6,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: CustomTextStyles
                                                              .bodySmallPoppinsGray70001)),
                                                  SizedBox(height: 14.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25.h),
                                                      child: Text(
                                                          "msg_berita_ini_mengandung"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallPoppinsBlack900_1)),
                                                  SizedBox(height: 17.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25.h),
                                                      child: Text(
                                                          "msg_berita_ini_mengandung2"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallPoppinsBlack900_1)),
                                                  SizedBox(height: 17.v)
                                                ])))
                                  ]))
                        ])))));
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
        ]);
  }

  /// Section Widget
  Widget _buildSolarHeartBold() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 25.h, right: 28.h, bottom: 273.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    _buildFrameThirtySeven(
                        userImage: ImageConstant.imgSolarHeartBoldRed70001,
                        userLabel: "lbl_100".tr),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: _buildFrameThirtySeven(
                            userImage:
                                ImageConstant.imgPhBookmarkSimpleFillOnerror,
                            userLabel: "lbl_100".tr)),
                    Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: _buildFrameThirtySeven(
                            userImage: ImageConstant.imgMajesticonsShareCircle,
                            userLabel: "lbl_100".tr))
                  ])),
              SizedBox(height: 19.v),
              Container(
                  width: 307.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 9.v),
                  decoration: AppDecoration.fillBluegray100
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Text("msg_tambahkan_komentar".tr,
                      style: CustomTextStyles.bodySmallGray60003)),
              SizedBox(height: 16.v),
              _buildFrameSixtySix(
                  ronsi: "lbl_ronsi".tr,
                  hCounter: "lbl_6_h".tr,
                  apakahTidakMasalah: "msg_apakah_tidak_masalah".tr,
                  wpfLike: ImageConstant.imgWpfLike,
                  likesCounter: "lbl_40_likes".tr,
                  reply: "lbl_reply".tr,
                  viewMoreReplies: "msg_view_more_54_replies".tr),
              SizedBox(height: 17.v),
              _buildFrameSixtySix(
                  ronsi: "lbl_ronsi".tr,
                  hCounter: "lbl_6_h".tr,
                  apakahTidakMasalah: "msg_apakah_tidak_masalah".tr,
                  wpfLike: ImageConstant.imgWpfLikeGray900,
                  likesCounter: "lbl_40_likes".tr,
                  reply: "lbl_reply".tr,
                  viewMoreReplies: "msg_view_more_54_replies".tr)
            ])));
  }

  /// Section Widget
  Widget _buildBeritaSerupa() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(bottom: 19.v),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text("lbl_berita_serupa".tr,
                          style: theme.textTheme.labelLarge)),
                  SizedBox(height: 8.v),
                  SizedBox(
                      height: 199.v,
                      child: Obx(() => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10.h);
                          },
                          itemCount: controller.blokirCommentModelObj.value
                              .blokircommentItemList.value.length,
                          itemBuilder: (context, index) {
                            BlokircommentItemModel model = controller
                                .blokirCommentModelObj
                                .value
                                .blokircommentItemList
                                .value[index];
                            return BlokircommentItemWidget(model);
                          })))
                ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar1() {
    return CustomAppBar(
        height: 24.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h)),
        title: AppbarTitle(
            text: "lbl_ronsi".tr, margin: EdgeInsets.only(left: 94.h)));
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

  /// Common widget
  Widget _buildFrameSixtySix({
    required String ronsi,
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
                          Text(ronsi,
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
