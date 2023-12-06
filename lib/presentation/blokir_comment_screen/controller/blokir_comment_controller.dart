import 'package:new_agg/core/app_export.dart';
import 'package:new_agg/presentation/blokir_comment_screen/models/blokir_comment_model.dart';

/// A controller class for the BlokirCommentScreen.
///
/// This class manages the state of the BlokirCommentScreen, including the
/// current blokirCommentModelObj
class BlokirCommentController extends GetxController {
  Rx<BlokirCommentModel> blokirCommentModelObj = BlokirCommentModel().obs;
}
