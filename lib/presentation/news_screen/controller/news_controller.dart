import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/news_screen/models/news_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NewsScreen.
///
/// This class manages the state of the NewsScreen, including the
/// current newsModelObj
class NewsController extends GetxController {
  TextEditingController frameFiftyNineController = TextEditingController();

  Rx<NewsModel> newsModelObj = NewsModel().obs;

  @override
  void onClose() {
    super.onClose();
    frameFiftyNineController.dispose();
  }
}
