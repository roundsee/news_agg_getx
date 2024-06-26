import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/trending_page/models/trending_model.dart';

/// A controller class for the TrendingPage.
///
/// This class manages the state of the TrendingPage, including the
/// current trendingModelObj
class TrendingController extends GetxController {
  TrendingController(this.trendingModelObj);

  Rx<TrendingModel> trendingModelObj;
}
