import '../../../core/app_export.dart';

/// This class is used in the [ninetyfoursection_item_widget] screen.
class GeneralNewsItemModel {
  GeneralNewsItemModel({
    this.category,
    this.politik1,
    this.title,
    this.description,
    this.publish,
    this.jLike,
    this.jSave,
    this.jShare,
    this.id,
  }) {
    category = category ?? Rx("Politik");
    politik1 = politik1 ?? Rx("Politik");
    title = title ??
        Rx("Britania Raya Resmi Menarik Diri dari Uni Eropa");
    description = description ??
        Rx("Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling");
    publish = publish ?? Rx("4 jam yang lalu");
    jLike = jLike ?? Rx("100");
    jSave = jSave ?? Rx("100");
    jShare = jShare ?? Rx("100");
    id = id ?? Rx("");
  }

  Rx<String>? category;

  Rx<String>? politik1;

  Rx<String>? title;

  Rx<String>? description;

  Rx<String>? publish;

  Rx<String>? jLike;

  Rx<String>? jSave;

  Rx<String>? jShare;

  Rx<String>? id;
}
