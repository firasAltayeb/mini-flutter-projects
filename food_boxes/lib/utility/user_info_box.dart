import 'package:food_boxes/app_constants.dart';
import 'package:hive/hive.dart';

class UserInfoBox {
  static const _userFirstNameKey = "userFirstNameKey";
  static const _userLastNameKey = "userLastNameKey";
  static const _userAgeKey = "userAgeKey";

  static late final Box<dynamic> _box;

  UserInfoBox() {
    _box = Hive.box<dynamic>(AppConstants.boxName);
  }

  static T _getValue<T>(dynamic key) => _box.get(key) as T;

  static Future<void> _setValue<T>(dynamic key, T value) =>
      _box.put(key, value);

  // Setters
  static Future<void> setFirstName(String value) {
    return _setValue(_userFirstNameKey, value);
  }

  static Future<void> setLastName(String value) {
    return _setValue(_userLastNameKey, value);
  }

  static Future<void> setAge(String value) {
    return _setValue(_userAgeKey, int.parse(value));
  }

  // Getters
  static String getFirstName() {
    if (_getValue(_userFirstNameKey) == null) {
      return "";
    }
    return _getValue<String>(_userFirstNameKey);
  }

  static String getLastName() {
    if (_getValue(_userLastNameKey) == null) {
      return "";
    }
    return _getValue<String>(_userLastNameKey);
  }

  static int getAge() {
    if (_getValue(_userAgeKey) == null) {
      return 0;
    }
    return _getValue<int>(_userAgeKey);
  }
}
