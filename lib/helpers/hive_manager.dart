import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static Box? _dataBox;
  static Box? _settingsBox;

  static const String _onboardingKey = "show_onboarding";
  String get onboardingKey => _onboardingKey;

  static const String _userKey = "logged_in_user";
  String get loggedInUserKey => _userKey;

  static const String _wishlistKey = "wishlist";
  String get wishlistKey => _wishlistKey;

  static const String _cartKey = "cart";
  String get cartKey => _cartKey;

  static Future<void> init() async {
    Hive.initFlutter();
    _dataBox = await Hive.openBox("electoko_data");
    _settingsBox = await Hive.openBox("electoko_settings");
  }

  Box get getDataBox {
    if (_dataBox == null) {
      throw Error();
    }

    return _dataBox!;
  }

  Box get getSettingsBox {
    if (_settingsBox == null) {
      throw Error();
    }

    return _settingsBox!;
  }
}
