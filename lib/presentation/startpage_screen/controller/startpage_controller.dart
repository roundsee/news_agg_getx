import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/startpage_screen/models/startpage_model.dart';

/// A controller class for the StartpageScreen.
///
/// This class manages the state of the StartpageScreen, including the
/// current startpageModelObj
class StartpageController extends GetxController {
  Rx<StartpageModel> startpageModelObj = StartpageModel().obs;
}
