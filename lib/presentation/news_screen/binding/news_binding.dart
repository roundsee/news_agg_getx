import '../controller/news_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NewsScreen.
///
/// This class ensures that the NewsController is created when the
/// NewsScreen is first loaded.
class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}
