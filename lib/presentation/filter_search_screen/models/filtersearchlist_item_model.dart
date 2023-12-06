import '../../../core/app_export.dart';

/// This class is used in the [filtersearchlist_item_widget] screen.
class FiltersearchlistItemModel {
  FiltersearchlistItemModel({
    this.politics,
    this.politics1,
    this.id,
  }) {
    politics = politics ?? Rx(ImageConstant.imgFa6SolidSquareCheck);
    politics1 = politics1 ?? Rx("Politics");
    id = id ?? Rx("");
  }

  Rx<String>? politics;

  Rx<String>? politics1;

  Rx<String>? id;
}
