import '../history_page/widgets/historypage_item_widget.dart';
import 'controller/history_controller.dart';
import 'models/history_model.dart';
import 'models/historypage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:new_agg/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  HistoryController controller = Get.put(HistoryController(HistoryModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(
                    children: [SizedBox(height: 25.v), _buildHistoryPage()]))));
  }

  /// Section Widget
  Widget _buildHistoryPage() {
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
                    .historyModelObj.value.historypageItemList.value.length,
                itemBuilder: (context, index) {
                  HistorypageItemModel model = controller
                      .historyModelObj.value.historypageItemList.value[index];
                  return HistorypageItemWidget(model, onTapCardNews: () {
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
