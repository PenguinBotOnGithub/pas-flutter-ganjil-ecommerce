import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static Box? _dataBox;
  static Box? _settingsBox;

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
