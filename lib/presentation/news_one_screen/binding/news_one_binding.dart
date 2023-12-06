import '../controller/news_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NewsOneScreen.
///
/// This class ensures that the NewsOneController is created when the
/// NewsOneScreen is first loaded.
class NewsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsOneController());
  }
}
