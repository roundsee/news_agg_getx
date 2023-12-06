import '../controller/blokir_comment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BlokirCommentScreen.
///
/// This class ensures that the BlokirCommentController is created when the
/// BlokirCommentScreen is first loaded.
class BlokirCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlokirCommentController());
  }
}
