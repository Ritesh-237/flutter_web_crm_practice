import '../models/user_model.dart';
import '../utils/shared_preferences.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;
  UserManager._internal();

  UserModel? _currentUser;

  Future<void> init() async {
    _currentUser = LocalStoragePref().getUserModel();
  }

  Future<void> setUser(UserModel user) async {
    _currentUser = user;
    await LocalStoragePref().setUserModel(user);
  }

  UserModel? get currentUser => _currentUser;

  Future<void> clearUser() async {
    _currentUser = null;
    await LocalStoragePref().clearKey(LocalStorageKeys.userProfile);
  }

  bool isAdmin() => _currentUser?.role == "admin";
  bool isMaid() => _currentUser?.role == "candidate";
  bool isCustomer() => _currentUser?.role == "customer";
}
