import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/push_notification_screen/models/push_notification_model.dart';

/// A controller class for the PushNotificationScreen.
///
/// This class manages the state of the PushNotificationScreen, including the
/// current pushNotificationModelObj
class PushNotificationController extends GetxController {
  Rx<PushNotificationModel> pushNotificationModelObj =
      PushNotificationModel().obs;
}
