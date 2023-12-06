import '../../../core/app_export.dart';

/// This class is used in the [profilelist_item_widget] screen.
class ProfilelistItemModel {
  ProfilelistItemModel({
    this.beritaYangDisukai,
    this.threeHundredFiftyFive,
    this.id,
  }) {
    beritaYangDisukai = beritaYangDisukai ?? Rx("Berita yang disukai");
    threeHundredFiftyFive = threeHundredFiftyFive ?? Rx("355");
    id = id ?? Rx("");
  }

  Rx<String>? beritaYangDisukai;

  Rx<String>? threeHundredFiftyFive;

  Rx<String>? id;
}
