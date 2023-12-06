import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/ukuran_text_screen/models/ukuran_text_model.dart';

/// A controller class for the UkuranTextScreen.
///
/// This class manages the state of the UkuranTextScreen, including the
/// current ukuranTextModelObj
class UkuranTextController extends GetxController {
  Rx<UkuranTextModel> ukuranTextModelObj = UkuranTextModel().obs;

  Rx<String> radioGroup = "".obs;
}
