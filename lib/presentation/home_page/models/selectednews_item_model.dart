import '../../../core/app_export.dart';

/// This class is used in the [selectedNews_item_widget] screen.
class SelectedNewsItemModel {
  SelectedNewsItemModel({
    this.category,
    this.politik1,
    this.title,
    this.jLike,
    this.jSave,
    this.jShare,
    this.description,
    this.publish,
    this.id,
  }) {
    category = category ?? Rx("Politik");
    politik1 = politik1 ?? Rx("Politik");
    title = title ?? Rx("Title ");
    jLike = jLike ?? Rx("0");
    jSave = jSave ?? Rx("0");
    jShare = jShare ?? Rx("0");
    description = description ?? Rx("Description");
    publish = publish ?? Rx("4 jam yang lalu");
    id = id ?? Rx("");
  }

  Rx<String>? category;

  Rx<String>? politik1;

  Rx<String>? title;

  Rx<String>? jLike;

  Rx<String>? jSave;

  Rx<String>? jShare;

  Rx<String>? description;

  Rx<String>? publish;

  Rx<String>? id;
}
