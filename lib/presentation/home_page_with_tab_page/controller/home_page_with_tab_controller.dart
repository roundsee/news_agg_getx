import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/home_page_with_tab_page/models/home_page_with_tab_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomePageWithTabPage.
///
/// This class manages the state of the HomePageWithTabPage, including the
/// current homePageWithTabModelObj
class HomePageWithTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomePageWithTabController(this.homePageWithTabModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<HomePageWithTabModel> homePageWithTabModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
