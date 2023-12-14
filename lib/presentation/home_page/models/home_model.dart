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
        title: "Title 1 ".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs,
        description: "Description 1".obs,
        publish: "4 jam yang lalu".obs),
    SelectedNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Title 2 ".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs,
        description: "Description 2".obs,
        publish: "4 jam yang lalu".obs),
    SelectedNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Title 3 ".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs,
        description: "Description 2".obs,
        publish: "4 jam yang lalu".obs),
  ]);

  Rx<List<GeneralNewsItemModel>> generalNewsItemList = Rx([
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Title 1".obs,
        description: "Deescription 1".obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Title 1".obs,
        description: "Description 1".obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
    GeneralNewsItemModel(
        category: "Politik".obs,
        politik1: "Politik".obs,
        title: "Title 2".obs,
        description: "Description 2".obs,
        publish: "4 jam yang lalu".obs,
        jLike: "100".obs,
        jSave: "100".obs,
        jShare: "100".obs),
  ]);
}
