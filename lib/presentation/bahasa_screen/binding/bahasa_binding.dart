import '../controller/bahasa_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BahasaScreen.
///
/// This class ensures that the BahasaController is created when the
/// BahasaScreen is first loaded.
class BahasaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BahasaController());
  }
}
