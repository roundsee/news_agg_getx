import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/filter_search_screen/models/filter_search_model.dart';

/// A controller class for the FilterSearchScreen.
///
/// This class manages the state of the FilterSearchScreen, including the
/// current filterSearchModelObj
class FilterSearchController extends GetxController {
  Rx<FilterSearchModel> filterSearchModelObj = FilterSearchModel().obs;
}
