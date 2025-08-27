import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class LocalStoragePref {
  static final LocalStoragePref _instance = LocalStoragePref._internal();
  static SharedPreferences? _storage;

  static LocalStoragePref get instance => _instance;

  factory LocalStoragePref() => _instance;
  LocalStoragePref._internal();

  Future<void> initPrefBox() async {
    _storage ??= await SharedPreferences.getInstance();
  }

  Future<void> clearKey(String key) async => _storage?.remove(key);

  Future<void> setLoginBool(bool value) async {
    await _storage?.setBool(LocalStorageKeys.isLoggedIn, value);
  }

  bool? getLoginBool() {
    return _storage?.getBool(LocalStorageKeys.isLoggedIn);
  }

  Future<void> setUserModel(UserModel model) async {
    await _storage?.setString(
      LocalStorageKeys.userProfile,
      jsonEncode(model.toJson()),
    );
  }

  UserModel? getUserModel() {
    final jsonStr = _storage?.getString(LocalStorageKeys.userProfile);
    if (jsonStr == null) return null;
    return UserModel.fromJson(jsonDecode(jsonStr));
  }
}

class LocalStorageKeys {
  static const isLoggedIn = 'isLoggedIn';
  static const userProfile = 'user_profile';
}
