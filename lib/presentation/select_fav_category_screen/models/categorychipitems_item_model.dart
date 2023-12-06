import '../../../core/app_export.dart';

/// This class is used in the [categorychipitems_item_widget] screen.
class CategorychipitemsItemModel {
  Rx<String>? sport = Rx("Sport");

  Rx<bool>? isSelected = Rx(false);
}

class ChipCategory {
  ChipCategory({
    required this.idx,
    required this.isSelected,
    this.title,
  });

  int? idx;
  int? isSelected;
  String? title;

  ChipCategory.fromJson(Map<String, dynamic> json) {
    idx = json['idx'];
    isSelected = json['isSelected'];
    title = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idx'] = idx;
    _data['isSelected'] = isSelected;
    _data['title'] = title;
    return _data;
  }
}
