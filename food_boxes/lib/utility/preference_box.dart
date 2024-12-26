import 'package:hive/hive.dart';

import '../app_constants.dart';

class PreferenceBox {
  static const _confirmLogoutToggle = "confirmLogoutToggleKey";

  late final Box<dynamic> _box;

  PreferenceBox._(this._box);

  static PreferenceBox getInstance() {
    final box = Hive.box(AppConstants.boxName);
    return PreferenceBox._(box);
  }

  T _getValue<T>(dynamic key) => _box.get(key) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);

  // Setters

  Future<void> setConfirmLogoutToggle(bool value) {
    return _setValue(_confirmLogoutToggle, value);
  }

  // Getters

  bool getConfirmLogoutToggle() {
    if (_getValue(_confirmLogoutToggle) == null) {
      return false;
    }
    return _getValue<bool>(_confirmLogoutToggle);
  }
}
