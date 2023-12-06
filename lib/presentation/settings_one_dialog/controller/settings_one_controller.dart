import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/settings_one_dialog/models/settings_one_model.dart';

/// A controller class for the SettingsOneDialog.
///
/// This class manages the state of the SettingsOneDialog, including the
/// current settingsOneModelObj
class SettingsOneController extends GetxController {
  Rx<SettingsOneModel> settingsOneModelObj = SettingsOneModel().obs;
}
