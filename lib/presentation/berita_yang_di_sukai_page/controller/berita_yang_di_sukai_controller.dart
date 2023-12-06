import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/berita_yang_di_sukai_page/models/berita_yang_di_sukai_model.dart';

/// A controller class for the BeritaYangDiSukaiPage.
///
/// This class manages the state of the BeritaYangDiSukaiPage, including the
/// current beritaYangDiSukaiModelObj
class BeritaYangDiSukaiController extends GetxController {
  BeritaYangDiSukaiController(this.beritaYangDiSukaiModelObj);

  Rx<BeritaYangDiSukaiModel> beritaYangDiSukaiModelObj;
}
