import '../../../core/app_export.dart';

/// This class is used in the [searchpage_item_widget] screen.
class SearchpageItemModel {
  SearchpageItemModel({
    this.rumahSakitDiGaza,
    this.oktober,
    this.image,
    this.id,
  }) {
    rumahSakitDiGaza = rumahSakitDiGaza ??
        Rx("Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah");
    oktober = oktober ?? Rx("11 Oktober 2023 . Kesehatan ");
    image = image ?? Rx(ImageConstant.imgFrame85);
    id = id ?? Rx("");
  }

  Rx<String>? rumahSakitDiGaza;

  Rx<String>? oktober;

  Rx<String>? image;

  Rx<String>? id;
}
