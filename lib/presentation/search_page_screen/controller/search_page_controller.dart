import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/search_page_screen/models/search_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SearchPageScreen.
///
/// This class manages the state of the SearchPageScreen, including the
/// current searchPageModelObj
class SearchPageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<SearchPageModel> searchPageModelObj = SearchPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
