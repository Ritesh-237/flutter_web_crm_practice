import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePref {
  static final LocalStoragePref _instance = LocalStoragePref._internal();
  static SharedPreferences? _storage;

  factory LocalStoragePref() {
    return _instance;
  }

  LocalStoragePref._internal();

  Future<void> initPrefBox() async {
    _storage ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAllPref() async {
    await _storage?.clear();
  }

  Future<void> setLoginBool(bool value) async {
    await _storage?.setBool(LocalStorageKeys.isLoggedIn, value);
  }

  bool? getLoginBool() {
    return _storage?.getBool(LocalStorageKeys.isLoggedIn);
  }
}

class LocalStorageKeys {
  static const isLoggedIn = 'isLoggedIn';
}
