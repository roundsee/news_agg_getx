import '../../../core/app_export.dart';

/// This class is used in the [historypage_item_widget] screen.
class HistorypageItemModel {
  HistorypageItemModel({
    this.politik,
    this.elonMuskMemaksa,
    this.aksiBoykotMasal,
    this.jamYangLalu,
    this.oneHundred,
    this.oneHundred1,
    this.oneHundred2,
    this.id,
  }) {
    politik = politik ?? Rx("Politik");
    elonMuskMemaksa = elonMuskMemaksa ??
        Rx("Elon Musk Memaksa Donald Trump Ambil Tindakan serius");
    aksiBoykotMasal = aksiBoykotMasal ??
        Rx("Aksi boykot masal yang dilakukan donald trump mempengaruhi ekonomi amerika");
    jamYangLalu = jamYangLalu ?? Rx("4 jam yang lalu");
    oneHundred = oneHundred ?? Rx("100");
    oneHundred1 = oneHundred1 ?? Rx("100");
    oneHundred2 = oneHundred2 ?? Rx("100");
    id = id ?? Rx("");
  }

  Rx<String>? politik;

  Rx<String>? elonMuskMemaksa;

  Rx<String>? aksiBoykotMasal;

  Rx<String>? jamYangLalu;

  Rx<String>? oneHundred;

  Rx<String>? oneHundred1;

  Rx<String>? oneHundred2;

  Rx<String>? id;
}
