import '../../../core/app_export.dart';
import 'recommended_item_model.dart';
import 'selectednews_item_model.dart';
import 'generalnews_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<RecommendedItemModel>> recommendedItemList = Rx([
    RecommendedItemModel(
        title: "Recommended Title".obs,
        publishAt: "11 Oktober 2023 . Kesehatan ".obs),
    RecommendedItemModel(
        title: "Recommended Title".obs,
        publishAt: "11 Oktober 2023 . Kesehatan ".obs),
    /*
    RecommendedItemModel(
        title: "Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah".obs,
        publishAt: "11 Oktober 2023 . Kesehatan ".obs),
    RecommendedItemModel(
        title: "Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah".obs,
        publishAt: "11 Oktober 2023 . Kesehatan ".obs),
    RecommendedItemModel(
        title: "Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah".obs,
        publishAt: "11 Oktober 2023 . Kesehatan ".obs)
  */
  ]);

  Rx<List<SelectedNewsItemModel>> selectedNewsItemList = Rx([
    SelectedNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Keputusan Prabowo Pembawa Gibran Menjadi Cawapres ".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs,
        description:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        publish: "4 jam yang lalu".obs),
    SelectedNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Keputusan Prabowo Pembawa Gibran Menjadi Cawapres ".obs),
    SelectedNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Keputusan Prabowo Pembawa Gibran Menjadi Cawapres ".obs)
  ]);

  Rx<List<GeneralNewsItemModel>> generalNewsItemList = Rx([
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Britania Raya Resmi Menarik Diri dari Uni Eropa".obs,
        description:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Britania Raya Resmi Menarik Diri dari Uni Eropa".obs,
        description:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Britania Raya Resmi Menarik Diri dari Uni Eropa".obs,
        description:
            "Keputusan Inggris sudah bulat untuk meninggalkan uni eropa setelah mengganti mata uang mereka menjadi poundsterling"
                .obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
  ]);
}
