import 'package:gadwal_aldarb/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserService {
  static const String _boxName = 'users';
  static const String _currentUserKey = 'currentUser';

  static Box<WhoUser> get _box => Hive.box<WhoUser>(_boxName);

  /// حفظ المستخدم الحالي
  static Future<void> saveUser(WhoUser user) async {
    await _box.put(_currentUserKey, user);
  }

  /// جلب المستخدم الحالي
  static WhoUser? getCurrentUser() {
    return _box.get(_currentUserKey);
  }

  /// هل يوجد مستخدم مسجل؟
  static bool isLoggedIn() {
    return _box.containsKey(_currentUserKey);
  }

  /// تسجيل الخروج
  static Future<void> logout() async {
    await _box.delete(_currentUserKey);
  }
}
