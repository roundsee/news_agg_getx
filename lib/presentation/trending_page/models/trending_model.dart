import '../../../core/app_export.dart';
import 'trendingpage_item_model.dart';

/// This class defines the variables used in the [trending_page],
/// and is typically used to hold data that is passed between different parts of the application.
class TrendingModel {
  Rx<List<TrendingpageItemModel>> trendingpageItemList = Rx([
    TrendingpageItemModel(
        politik: "Politik".obs,
        elonMuskMemaksa:
            "Elon Musk Memaksa Donald Trump Ambil Tindakan serius".obs,
        aksiBoykotMasal:
            "Aksi boykot masal yang dilakukan donald trump mempengaruhi ekonomi amerika"
                .obs,
        jamYangLalu: "4 jam yang lalu".obs,
        oneHundred: "100".obs,
        oneHundred1: "100".obs,
        oneHundred2: "100".obs),
    TrendingpageItemModel(
        elonMuskMemaksa: "Britania Raya Resmi Menarik Diri dari Uni Eropa".obs,
        aksiBoykotMasal:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        jamYangLalu: "4 jam yang lalu".obs,
        oneHundred: "100".obs,
        oneHundred1: "100".obs,
        oneHundred2: "100".obs)
  ]);
}
