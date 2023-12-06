import '../../../core/app_export.dart';

/// This class is used in the [newsonelist_item_widget] screen.
class NewsonelistItemModel {
  NewsonelistItemModel({
    this.oneHundred,
    this.oneHundred1,
    this.oneHundred2,
    this.politik,
    this.politik1,
    this.keputusanPrabowo,
    this.description,
    this.jamYangLalu,
    this.id,
  }) {
    oneHundred = oneHundred ?? Rx("100");
    oneHundred1 = oneHundred1 ?? Rx("100");
    oneHundred2 = oneHundred2 ?? Rx("100");
    politik = politik ?? Rx("Politik");
    politik1 = politik1 ?? Rx("Politik");
    keputusanPrabowo = keputusanPrabowo ??
        Rx("Keputusan Prabowo Pembawa Gibran Menjadi Cawapres ");
    description = description ??
        Rx("Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling");
    jamYangLalu = jamYangLalu ?? Rx("4 jam yang lalu");
    id = id ?? Rx("");
  }

  Rx<String>? oneHundred;

  Rx<String>? oneHundred1;

  Rx<String>? oneHundred2;

  Rx<String>? politik;

  Rx<String>? politik1;

  Rx<String>? keputusanPrabowo;

  Rx<String>? description;

  Rx<String>? jamYangLalu;

  Rx<String>? id;
}
