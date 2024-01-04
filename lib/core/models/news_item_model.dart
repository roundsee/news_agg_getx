import '../../../core/app_export.dart';

/// This class is used in the Search result Page screen.
class NewsItemModel {
  NewsItemModel({
    this.category,
    this.title,
    this.description,
    this.publish,
/*    this.jLike,
    this.jSave,
    this.jShare,
*/
    this.id,
  }) {
    category = category ?? Rx("Category");
    title = title ?? Rx("Title");
    description = description ?? Rx("Description");
    publish = publish ?? Rx("Publish At");
    /*
    jLike = jLike ?? Rx("100");
    jSave = jSave ?? Rx("100");
    jShare = jShare ?? Rx("100");
    */
    id = id ?? Rx("");
  }

  Rx<String>? category;

  Rx<String>? title;

  Rx<String>? description;

  Rx<String>? publish;

  /*
  Rx<String>? jLike;

  Rx<String>? jSave;

  Rx<String>? jShare;
*/
  Rx<String>? id;
}
