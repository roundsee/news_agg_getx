import '../trending_page/widgets/trendingpage_item_widget.dart';
import 'controller/trending_controller.dart';
import 'models/trending_model.dart';
import 'models/trendingpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class TrendingPage extends StatelessWidget {
  TrendingPage({Key? key}) : super(key: key);

  TrendingController controller =
      Get.put(TrendingController(TrendingModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(children: [
                  SizedBox(height: 25.v),
                  _buildTrendingPage()
                ]))));
  }

  /// Section Widget
  Widget _buildTrendingPage() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Obx(() => ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12.v);
                },
                itemCount: controller
                    .trendingModelObj.value.trendingpageItemList.value.length,
                itemBuilder: (context, index) {
                  TrendingpageItemModel model = controller
                      .trendingModelObj.value.trendingpageItemList.value[index];
                  return TrendingpageItemWidget(model, onTapCardNews: () {
                    onTapCardNews();
                  });
                }))));
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapCardNews() {
    Get.toNamed(
      AppRoutes.newsScreen,
    );
  }
}
