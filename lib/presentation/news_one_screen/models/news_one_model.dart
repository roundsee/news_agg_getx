import '../../../core/app_export.dart';
import 'newsonelist_item_model.dart';

/// This class defines the variables used in the [news_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NewsOneModel {
  Rx<List<NewsonelistItemModel>> newsonelistItemList = Rx([
    NewsonelistItemModel(
        oneHundred: "100".obs,
        oneHundred1: "100".obs,
        oneHundred2: "100".obs,
        politik: "Politik".obs,
        politik1: "Politik".obs,
        keputusanPrabowo:
            "Keputusan Prabowo Pembawa Gibran Menjadi Cawapres ".obs,
        description:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        jamYangLalu: "4 jam yang lalu".obs)
  ]);
}
