import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/story_news_screen/models/story_news_model.dart';

/// A controller class for the StoryNewsScreen.
///
/// This class manages the state of the StoryNewsScreen, including the
/// current storyNewsModelObj
class StoryNewsController extends GetxController {
  Rx<StoryNewsModel> storyNewsModelObj = StoryNewsModel().obs;
}
