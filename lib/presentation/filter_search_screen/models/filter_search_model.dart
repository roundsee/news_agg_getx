import '../../../core/app_export.dart';
import 'filtersearchlist_item_model.dart';

/// This class defines the variables used in the [filter_search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterSearchModel {
  Rx<List<FiltersearchlistItemModel>> filtersearchlistItemList = Rx([
    FiltersearchlistItemModel(
        politics: ImageConstant.imgFa6SolidSquareCheck.obs,
        politics1: "Politics".obs),
    FiltersearchlistItemModel(
        politics: ImageConstant.imgMdiCheckboxBlankOutline.obs,
        politics1: "Economics".obs),
    FiltersearchlistItemModel(
        politics: ImageConstant.imgMdiCheckboxBlankOutline.obs,
        politics1: "Sports".obs),
    FiltersearchlistItemModel(
        politics: ImageConstant.imgMdiCheckboxBlankOutline.obs,
        politics1: "Food".obs),
    FiltersearchlistItemModel(
        politics: ImageConstant.imgFa6SolidSquareCheck.obs,
        politics1: "Pemilu 2024".obs)
  ]);
}
