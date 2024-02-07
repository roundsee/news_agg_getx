import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';

/// A binding class for the BahasaScreen.
///
/// This class ensures that the BahasaController is created when the
/// BahasaScreen is first loaded.
class StoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryController());
  }
}
