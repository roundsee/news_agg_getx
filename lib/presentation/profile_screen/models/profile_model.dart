import '../../../core/app_export.dart';
import 'profilelist_item_model.dart';

/// This class defines the variables used in the [profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel {
  Rx<List<ProfilelistItemModel>> profilelistItemList = Rx([
    ProfilelistItemModel(
        beritaYangDisukai: "Berita yang disukai".obs,
        threeHundredFiftyFive: "355".obs),
    ProfilelistItemModel(
        beritaYangDisukai: "Berita yang dimpan".obs,
        threeHundredFiftyFive: "355".obs)
  ]);
}
