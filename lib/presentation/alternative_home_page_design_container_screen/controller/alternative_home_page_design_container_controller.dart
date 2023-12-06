import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/alternative_home_page_design_container_screen/models/alternative_home_page_design_container_model.dart';

/// A controller class for the AlternativeHomePageDesignContainerScreen.
///
/// This class manages the state of the AlternativeHomePageDesignContainerScreen, including the
/// current alternativeHomePageDesignContainerModelObj
class AlternativeHomePageDesignContainerController extends GetxController {
  Rx<AlternativeHomePageDesignContainerModel>
      alternativeHomePageDesignContainerModelObj =
      AlternativeHomePageDesignContainerModel().obs;
}
