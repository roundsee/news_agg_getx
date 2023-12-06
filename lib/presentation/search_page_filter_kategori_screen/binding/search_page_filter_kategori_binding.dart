import '../controller/search_page_filter_kategori_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchPageFilterKategoriScreen.
///
/// This class ensures that the SearchPageFilterKategoriController is created when the
/// SearchPageFilterKategoriScreen is first loaded.
class SearchPageFilterKategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageFilterKategoriController());
  }
}
