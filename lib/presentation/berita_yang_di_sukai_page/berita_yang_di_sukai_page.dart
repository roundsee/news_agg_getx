import '../berita_yang_di_sukai_page/widgets/beritayangdisukai_item_widget.dart';
import 'controller/berita_yang_di_sukai_controller.dart';
import 'models/berita_yang_di_sukai_model.dart';
import 'models/beritayangdisukai_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/widgets/app_bar/appbar_leading_image.dart';
import 'package:new_agg/widgets/app_bar/appbar_subtitle.dart';
import 'package:new_agg/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class BeritaYangDiSukaiPage extends StatelessWidget {
  BeritaYangDiSukaiPage({Key? key}) : super(key: key);

  BeritaYangDiSukaiController controller =
      Get.put(BeritaYangDiSukaiController(BeritaYangDiSukaiModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 9.v, right: 24.h),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 12.v);
                    },
                    itemCount: controller.beritaYangDiSukaiModelObj.value
                        .beritayangdisukaiItemList.value.length,
                    itemBuilder: (context, index) {
                      BeritayangdisukaiItemModel model = controller
                          .beritaYangDiSukaiModelObj
                          .value
                          .beritayangdisukaiItemList
                          .value[index];
                      return BeritayangdisukaiItemWidget(model,
                          onTapCardNews: () {
                        onTapCardNews();
                      });
                    })))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 69.v,
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 25.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "msg_berita_yang_di_simpan".tr,
            margin: EdgeInsets.only(left: 67.h)));
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapCardNews() {
    Get.toNamed(AppRoutes.newsScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
