import 'package:new_agg/core/controllers/news_controller.dart';

import '../news_screen/widgets/news_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_trailing_image.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';
import 'package:new_agg/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    // controller from GetView

//    return controller.obx(
//      (state) {
    //============================
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
                            child: Text(
                                //controller.newsModelObj.value.data!
                                //    .content!.title.obs
                                controller.title.value.toString(),
                                //controller.newsModelObj.value!.data!
                                //    .content!.title!
                                //    .toString(), //  "msg_elon_musk_memaksa2".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    CustomTextStyles.titleMediumInterSemiBold)),
                        SizedBox(height: 7.v),
                        Padding(
                            padding: EdgeInsets.only(left: 30.h),
                            child: Text("msg_lorem_ipsum_dolor".tr,
                                style: CustomTextStyles.titleSmallBluegray900)),
                        SizedBox(height: 8.v),
                        Padding(
                            padding: EdgeInsets.only(left: 28.h),
                            child: Text("test",
                                //controller
                                //    .newsModelObj.value.data!.content!.author
                                //    .toString(),
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
                                    style: CustomTextStyles.labelLargeMedium))),
                        SizedBox(height: 14.v),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.network(
                                controller.imgUrl.value.toString(),
                                fit: BoxFit.cover),
                          ),
                        ),
                        //CustomImageView(
                        //    imagePath: controller.imgUrl.value.toString(),
                        //.newsModelObj.value.data!.content!.header
                        //.toString(), //ImageConstant.imgRectangle8,
                        //    height: 223.v,
                        //    width: 307.h,
                        //    alignment: Alignment.center),
                        SizedBox(height: 14.v),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 307.h,
                                margin:
                                    EdgeInsets.only(left: 25.h, right: 28.h),
                                child: Text(controller.description.toString(),
                                    //.newsModelObj.value.data!.content!.body
                                    // .toString(),
                                    maxLines: 26,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.labelLargeMedium))),
                        SizedBox(height: 17.v),
                        Padding(
                            padding: EdgeInsets.only(left: 25.h),
                            child: Row(children: [
                              _buildFrameThirtySeven(
                                  userImage:
                                      ImageConstant.imgSolarHeartBoldRed70001,
                                  userLabel: controller.like.toString()),
                              // .newsModelObj.value.data!
                              //    .content!.statistics!.like
                              //    .toString()),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: _buildFrameThirtySeven(
                                      userImage: ImageConstant
                                          .imgPhBookmarkSimpleFillOnerror,
                                      userLabel: controller.jlike.toString())
                                  //controller.newsModelObj.value
                                  //    .data!.content!.statistics!.save
                                  //    .toString())
                                  ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: _buildFrameThirtySeven(
                                    userImage:
                                        ImageConstant.imgMajesticonsShareCircle,
                                    userLabel: controller.jshare.toString()),
                                //controller.newsModelObj.value
                                // .data!.content!.statistics!.share
                                //.toString())
                              )
                            ])),
                        SizedBox(height: 19.v),
                        Padding(
                            padding: EdgeInsets.only(left: 25.h, right: 28.h),
                            child: CustomTextFormField(
                                //controller:
                                //    controller.frameFiftyNineController,
                                hintText: "msg_tambahkan_komentar".tr,
                                hintStyle: CustomTextStyles.bodySmallGray60003,
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.center,
                                borderDecoration:
                                    TextFormFieldStyleHelper.fillBlueGray,
                                fillColor: appTheme.blueGray100)),
                        SizedBox(height: 16.v),
                        Padding(
                            padding: EdgeInsets.only(left: 25.h, right: 28.h),
                            child: _buildFrameSixtySix(
                                userName: "lbl_ronsi".tr,
                                hCounter: "lbl_6_h".tr,
                                message: "msg_apakah_tidak_masalah".tr,
                                wpfLike: ImageConstant.imgWpfLike,
                                likesCounter: "lbl_40_likes".tr,
                                reply: "lbl_reply".tr,
                                viewMoreReplies:
                                    "msg_view_more_54_replies".tr)),
                        SizedBox(height: 17.v),
                        Padding(
                            padding: EdgeInsets.only(left: 25.h, right: 28.h),
                            child: _buildFrameSixtySix(
                                userName: "lbl_ronsi".tr,
                                hCounter: "lbl_6_h".tr,
                                message: "msg_apakah_tidak_masalah".tr,
                                wpfLike: ImageConstant.imgWpfLikeGray900,
                                likesCounter: "lbl_40_likes".tr,
                                reply: "lbl_reply".tr,
                                viewMoreReplies:
                                    "msg_view_more_54_replies".tr)),
                        SizedBox(height: 31.v),
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text("lbl_berita_serupa".tr,
                                style: theme.textTheme.labelLarge)),
                        SizedBox(height: 8.v),
                        _buildNews()
                      ])))),
      /**
              onLoading: Container(
                  child: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 100.0,
                  width: 100.0,
                ),
              )),
              */
    ));

    //==============================
//      },

//    );
/*
    mediaQueryData = MediaQuery.of(context);

    if (controller.isLoading.value) {
      return CircularProgressIndicator();
    } else {
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
                                    child: Text(
                                        controller.newsModelObj.value!.data!
                                            .content!.title!
                                            .toString(), //  "msg_elon_musk_memaksa2".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .titleMediumInterSemiBold)),
                                SizedBox(height: 7.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 30.h),
                                    child: Text("msg_lorem_ipsum_dolor".tr,
                                        style: CustomTextStyles
                                            .titleSmallBluegray900)),
                                SizedBox(height: 8.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 28.h),
                                    child: Text(
                                        controller.newsModelObj.value.data!
                                            .content!.author
                                            .toString(),
                                        style: CustomTextStyles
                                            .bodySmallGray70002)),
                                SizedBox(height: 5.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 307.h,
                                        margin: EdgeInsets.only(
                                            left: 25.h, right: 28.h),
                                        child: Text("msg_lorem_ipsum_dolor2".tr,
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .labelLargeMedium))),
                                SizedBox(height: 14.v),
                                CustomImageView(
                                    imagePath: controller.newsModelObj.value
                                        .data!.content!.header
                                        .toString(), //ImageConstant.imgRectangle8,
                                    height: 223.v,
                                    width: 307.h,
                                    alignment: Alignment.center),
                                SizedBox(height: 14.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 307.h,
                                        margin: EdgeInsets.only(
                                            left: 25.h, right: 28.h),
                                        child: Text(
                                            controller.newsModelObj.value.data!
                                                .content!.body
                                                .toString(),
                                            maxLines: 26,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .labelLargeMedium))),
                                SizedBox(height: 17.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 25.h),
                                    child: Row(children: [
                                      _buildFrameThirtySeven(
                                          userImage: ImageConstant
                                              .imgSolarHeartBoldRed70001,
                                          userLabel: controller
                                              .newsModelObj
                                              .value
                                              .data!
                                              .content!
                                              .statistics!
                                              .like
                                              .toString()),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.h),
                                          child: _buildFrameThirtySeven(
                                              userImage: ImageConstant
                                                  .imgPhBookmarkSimpleFillOnerror,
                                              userLabel: controller
                                                  .newsModelObj
                                                  .value
                                                  .data!
                                                  .content!
                                                  .statistics!
                                                  .save
                                                  .toString())),
                                      Padding(
                                          padding: EdgeInsets.only(left: 10.h),
                                          child: _buildFrameThirtySeven(
                                              userImage: ImageConstant
                                                  .imgMajesticonsShareCircle,
                                              userLabel: controller
                                                  .newsModelObj
                                                  .value
                                                  .data!
                                                  .content!
                                                  .statistics!
                                                  .share
                                                  .toString()))
                                    ])),
                                SizedBox(height: 19.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.h, right: 28.h),
                                    child: CustomTextFormField(
                                        //controller:
                                        //    controller.frameFiftyNineController,
                                        hintText: "msg_tambahkan_komentar".tr,
                                        hintStyle:
                                            CustomTextStyles.bodySmallGray60003,
                                        textInputAction: TextInputAction.done,
                                        alignment: Alignment.center,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .fillBlueGray,
                                        fillColor: appTheme.blueGray100)),
                                SizedBox(height: 16.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.h, right: 28.h),
                                    child: _buildFrameSixtySix(
                                        userName: "lbl_ronsi".tr,
                                        hCounter: "lbl_6_h".tr,
                                        message: "msg_apakah_tidak_masalah".tr,
                                        wpfLike: ImageConstant.imgWpfLike,
                                        likesCounter: "lbl_40_likes".tr,
                                        reply: "lbl_reply".tr,
                                        viewMoreReplies:
                                            "msg_view_more_54_replies".tr)),
                                SizedBox(height: 17.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.h, right: 28.h),
                                    child: _buildFrameSixtySix(
                                        userName: "lbl_ronsi".tr,
                                        hCounter: "lbl_6_h".tr,
                                        message: "msg_apakah_tidak_masalah".tr,
                                        wpfLike:
                                            ImageConstant.imgWpfLikeGray900,
                                        likesCounter: "lbl_40_likes".tr,
                                        reply: "lbl_reply".tr,
                                        viewMoreReplies:
                                            "msg_view_more_54_replies".tr)),
                                SizedBox(height: 31.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: Text("lbl_berita_serupa".tr,
                                        style: theme.textTheme.labelLarge)),
                                SizedBox(height: 8.v),
                                _buildNews()
                              ]))))));
    */
    // if loaded
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
  Widget _buildNews() {
    return SizedBox(height: 333, child: Text("ddd"));
    /* return SizedBox(
        height: 199.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.h);
            },
            /*
            itemCount: controller.newsModelObj.value.newsItemList.value.length,
            itemBuilder: (context, index) {
              NewsItemModel model =
                  controller.newsModelObj.value.newsItemList.value[index];
              return NewsItemWidget(model);

            }*/
            )));
       */
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
    required String userName,
    required String hCounter,
    required String message,
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
                                      child: Text(message,
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
