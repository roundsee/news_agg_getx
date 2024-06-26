//ignore: unused_import
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  String getUserToken() {
    try {
      return _sharedPreferences!.getString('token')!;
    } catch (e) {
      return '';
    }
  }

  String getStatusUser() {
    try {
      return _sharedPreferences!.getString('status')!;
    } catch (e) {
      return '0';
    }
  }

  String getfcmToken() {
    try {
      return _sharedPreferences!.getString('fcm')!;
    } catch (e) {
      return '0';
    }
  }

  String getSession() {
    try {
      return _sharedPreferences!.getString('appsession')!;
    } catch (e) {
      return '0';
    }
  }

  String getLanguage() {
    try {
      return _sharedPreferences!.getString('lang')!;
    } catch (e) {
      return 'ID';
    }
  }

  String getTextSize() {
    try {
      return _sharedPreferences!.getString('size')!;
    } catch (e) {
      return "";
    }
  }

  Future<void> setUserToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  Future<void> setStatusUser(String value) {
    return _sharedPreferences!.setString('status', value);
  }

  Future<void> setfcmToken(String value) {
    return _sharedPreferences!.setString('fcm', value);
  }

  Future<void> setLanguage(String value) {
    return _sharedPreferences!.setString('lang', value);
  }

  Future<void> setTextSize(String value) {
    return _sharedPreferences!.setString('size', value);
  }

  Future<void> setSession(String value) {
    return _sharedPreferences!.setString('appsession', value);
  }
}
