import 'categorychipitems_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [select_fav_category_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectFavCategoryModel {
  Rx<List<CategorychipitemsItemModel>> categorychipitemsItemList =
      Rx(List.generate(18, (index) => CategorychipitemsItemModel()));
}
