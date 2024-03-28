import 'package:get/get.dart';
import 'package:new_agg/localization/id/id_translations.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'id': id, 'en_US': en};
}
