import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/trending_page_tab_container_page/models/trending_page_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the TrendingPageTabContainerPage.
///
/// This class manages the state of the TrendingPageTabContainerPage, including the
/// current trendingPageTabContainerModelObj
class TrendingPageTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TrendingPageTabContainerController(this.trendingPageTabContainerModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<TrendingPageTabContainerModel> trendingPageTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 5));

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
