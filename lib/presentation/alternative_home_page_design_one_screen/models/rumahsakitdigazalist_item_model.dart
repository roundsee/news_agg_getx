import '../../../core/app_export.dart';

/// This class is used in the [rumahsakitdigazalist_item_widget] screen.
class RumahsakitdigazalistItemModel {
  RumahsakitdigazalistItemModel({
    this.rumahSakitDiGaza,
    this.oktober,
    this.id,
  }) {
    rumahSakitDiGaza = rumahSakitDiGaza ??
        Rx("Rumah Sakit Di Gaza Terancam Jadi Kamar Jenazah");
    oktober = oktober ?? Rx("11 Oktober 2023 . Kesehatan ");
    id = id ?? Rx("");
  }

  Rx<String>? rumahSakitDiGaza;

  Rx<String>? oktober;

  Rx<String>? id;
}
