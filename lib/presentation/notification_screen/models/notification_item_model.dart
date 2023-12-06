import '../../../core/app_export.dart';

/// This class is used in the [notification_item_widget] screen.
class NotificationItemModel {
  NotificationItemModel({
    this.menitCounter,
    this.id,
  }) {
    menitCounter = menitCounter ?? Rx("20 menit");
    id = id ?? Rx("");
  }

  Rx<String>? menitCounter;

  Rx<String>? id;
}
