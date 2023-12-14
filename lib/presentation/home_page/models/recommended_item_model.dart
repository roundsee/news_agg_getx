import '../../../core/app_export.dart';

/// This class is used in the [recommended_item_widget] screen.
class RecommendedItemModel {
  RecommendedItemModel({
    this.title,
    this.publishAt,
    this.id,
  }) {
    title = title ?? Rx("Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah");
    publishAt = publishAt ?? Rx("11 Oktober 2023 . Kesehatan ");
    id = id ?? Rx("");
  }

  Rx<String>? title;

  Rx<String>? publishAt;

  Rx<String>? id;
}
