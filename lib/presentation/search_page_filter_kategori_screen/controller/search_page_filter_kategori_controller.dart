import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/search_page_filter_kategori_screen/models/search_page_filter_kategori_model.dart';

/// A controller class for the SearchPageFilterKategoriScreen.
///
/// This class manages the state of the SearchPageFilterKategoriScreen, including the
/// current searchPageFilterKategoriModelObj
class SearchPageFilterKategoriController extends GetxController {
  Rx<SearchPageFilterKategoriModel> searchPageFilterKategoriModelObj =
      SearchPageFilterKategoriModel().obs;
}
