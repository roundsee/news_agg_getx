import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/alternative_home_page_design_one_screen/models/alternative_home_page_design_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AlternativeHomePageDesignOneScreen.
///
/// This class manages the state of the AlternativeHomePageDesignOneScreen, including the
/// current alternativeHomePageDesignOneModelObj
class AlternativeHomePageDesignOneController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AlternativeHomePageDesignOneModel> alternativeHomePageDesignOneModelObj =
      AlternativeHomePageDesignOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
