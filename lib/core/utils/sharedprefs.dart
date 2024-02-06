import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  static String keyAppVersion = "appversion"; // app version 1.1.x

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
  //Device Info Key
  static String keyBrand = "brand"; // Device Brand - Samsung, OPPO dst
  static String keyModel = "model"; //Device Model - A5, Oppo : F9
  static String keyOS = "os"; // Android 12, 13 dst

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

  String get size => _sharedPrefs.getString(keySize) ?? "";

  set size(String value) {
    _sharedPrefs.setString(keySize, value);
  }

  String get defaultToken => defaulttoken;

  //===============Device Info
  String get brand => _sharedPrefs.getString(keyBrand) ?? "";

  set brand(String value) {
    _sharedPrefs.setString(keyBrand, value);
  }

  String get model => _sharedPrefs.getString(keyModel) ?? "";

  set model(String value) {
    _sharedPrefs.setString(keyModel, value);
  }

  String get OS => _sharedPrefs.getString(keyOS) ?? "";

  set OS(String value) {
    _sharedPrefs.setString(keyOS, value);
  }
}
