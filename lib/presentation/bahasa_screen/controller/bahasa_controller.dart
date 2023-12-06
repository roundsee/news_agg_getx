import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/bahasa_screen/models/bahasa_model.dart';

/// A controller class for the BahasaScreen.
///
/// This class manages the state of the BahasaScreen, including the
/// current bahasaModelObj
class BahasaController extends GetxController {
  Rx<BahasaModel> bahasaModelObj = BahasaModel().obs;

  Rx<String> radioGroup = "".obs;
}
