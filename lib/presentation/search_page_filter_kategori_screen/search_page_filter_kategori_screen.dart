import 'controller/search_page_filter_kategori_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/custom_elevated_button.dart';
import 'package:new_agg/widgets/custom_outlined_button.dart';

class SearchPageFilterKategoriScreen
    extends GetWidget<SearchPageFilterKategoriController> {
  const SearchPageFilterKategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgSearchPageFilter),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Spacer(),
                      Expanded(
                          child: Container(
                              width: 359.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 45.v),
                              decoration: AppDecoration.outlineBlack900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_kategori".tr,
                                        style: CustomTextStyles.titleSmallBold),
                                    SizedBox(height: 16.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgFa6SolidSquareCheck,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 3.v,
                                              bottom: 3.v),
                                          child: Text("lbl_politics".tr,
                                              style:
                                                  theme.textTheme.titleSmall))
                                    ]),
                                    SizedBox(height: 11.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgMdiCheckboxBlankOutline,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 3.v,
                                              bottom: 3.v),
                                          child: Text("lbl_economics".tr,
                                              style:
                                                  theme.textTheme.titleSmall))
                                    ]),
                                    SizedBox(height: 11.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgMdiCheckboxBlankOutline,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h, top: 5.v),
                                          child: Text("lbl_sports".tr,
                                              style:
                                                  theme.textTheme.titleSmall))
                                    ]),
                                    SizedBox(height: 11.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgMdiCheckboxBlankOutline,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 3.v,
                                              bottom: 3.v),
                                          child: Text("lbl_food".tr,
                                              style:
                                                  theme.textTheme.titleSmall))
                                    ]),
                                    SizedBox(height: 11.v),
                                    Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgFa6SolidSquareCheck,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 3.v,
                                              bottom: 3.v),
                                          child: Text("lbl_pemilu_2024".tr,
                                              style:
                                                  theme.textTheme.titleSmall))
                                    ]),
                                    Spacer(),
                                    SizedBox(height: 6.v),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomOutlinedButton(
                                                  width: 95.h,
                                                  text: "lbl_batal".tr,
                                                  onPressed: () {
                                                    onTapBatal();
                                                  }),
                                              CustomElevatedButton(
                                                  width: 95.h,
                                                  text: "lbl_simpan".tr,
                                                  margin: EdgeInsets.only(
                                                      left: 23.h),
                                                  onPressed: () {
                                                    onTapSimpan();
                                                  })
                                            ]))
                                  ])))
                    ])))));
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapBatal() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapSimpan() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
