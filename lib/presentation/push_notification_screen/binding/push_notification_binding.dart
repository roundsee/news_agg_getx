import '../controller/push_notification_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PushNotificationScreen.
///
/// This class ensures that the PushNotificationController is created when the
/// PushNotificationScreen is first loaded.
class PushNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PushNotificationController());
  }
}
