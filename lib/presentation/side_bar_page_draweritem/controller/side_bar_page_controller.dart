import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/side_bar_page_draweritem/models/side_bar_page_model.dart';

/// A controller class for the SideBarPageDraweritem.
///
/// This class manages the state of the SideBarPageDraweritem, including the
/// current sideBarPageModelObj
class SideBarPageController extends GetxController {
  Rx<SideBarPageModel> sideBarPageModelObj = SideBarPageModel().obs;
}
