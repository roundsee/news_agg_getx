import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static final SharedPrefs _instance = SharedPrefs._internal();
  static String keyToken = "token";
  static String keySession = "appsession";
  static String keyFcm = "fcm";
  static String keyLanguage = "lang";
  static String keyStatus = "status";
  static String keySize = "size";
  static String keyTheme = "themedata";
  static String defaulttoken =
      "1705401024_16qCEN4vooAJNAFZepPO6DBj88x3T2sCGDaRQqbx_75d0d76b-9b72-4601-9a10-e2f00f732c3d";
  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get token => _sharedPrefs.getString(keyToken) ?? "";

  set token(String value) {
    _sharedPrefs.setString(keyToken, value);
  }

  String get session => _sharedPrefs.getString(keySession) ?? "";

  set session(String value) {
    _sharedPrefs.setString(keySession, value);
  }

  String get status => _sharedPrefs.getString(keyStatus) ?? "";

  set status(String value) {
    _sharedPrefs.setString(keyStatus, value);
  }

  String get fcm => _sharedPrefs.getString(keyFcm) ?? "";

  set fcm(String value) {
    _sharedPrefs.setString(keyFcm, value);
  }

  String get language => _sharedPrefs.getString(keyLanguage) ?? "";

  set language(String value) {
    _sharedPrefs.setString(keyLanguage, value);
  }

  String get defaultToken => defaulttoken;
}
