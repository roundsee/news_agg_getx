import '../controller/story_news_controller.dart';
import 'package:get/get.dart';

/// A binding class for the StoryNewsScreen.
///
/// This class ensures that the StoryNewsController is created when the
/// StoryNewsScreen is first loaded.
class StoryNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryNewsController());
  }
}
