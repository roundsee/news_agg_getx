import '../../../core/app_export.dart';

/// This class is used in the [politiklist_item_widget] screen.
class PolitiklistItemModel {
  PolitiklistItemModel({
    this.politik,
    this.politik1,
    this.britaniaRayaResmi,
    this.description,
    this.jamYangLalu,
    this.oneHundred,
    this.oneHundred1,
    this.oneHundred2,
    this.id,
  }) {
    politik = politik ?? Rx("Politik");
    politik1 = politik1 ?? Rx("Politik");
    britaniaRayaResmi = britaniaRayaResmi ??
        Rx("Britania Raya Resmi Menarik Diri dari Uni Eropa");
    description = description ??
        Rx("Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling");
    jamYangLalu = jamYangLalu ?? Rx("4 jam yang lalu");
    oneHundred = oneHundred ?? Rx("100");
    oneHundred1 = oneHundred1 ?? Rx("100");
    oneHundred2 = oneHundred2 ?? Rx("100");
    id = id ?? Rx("");
  }

  Rx<String>? politik;

  Rx<String>? politik1;

  Rx<String>? britaniaRayaResmi;

  Rx<String>? description;

  Rx<String>? jamYangLalu;

  Rx<String>? oneHundred;

  Rx<String>? oneHundred1;

  Rx<String>? oneHundred2;

  Rx<String>? id;
}
