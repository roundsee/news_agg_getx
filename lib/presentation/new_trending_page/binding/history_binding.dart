import 'package:get/get.dart';
import 'package:new_agg/presentation/new_trending_page/controller/new_trending_controller.dart';

/// A binding class for the ForgotPassScreen.
///
/// This class ensures that the ForgotPassController is created when the
/// ForgotPassScreen is first loaded.
class NewTrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewTrendingController());
  }
}
