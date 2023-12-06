import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/news_one_screen/models/news_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NewsOneScreen.
///
/// This class manages the state of the NewsOneScreen, including the
/// current newsOneModelObj
class NewsOneController extends GetxController {
  TextEditingController frameFiftyNineController = TextEditingController();

  Rx<NewsOneModel> newsOneModelObj = NewsOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    frameFiftyNineController.dispose();
  }
}
