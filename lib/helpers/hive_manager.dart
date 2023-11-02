import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static Box? _box;

  static Future<void> init() async {
    Hive.initFlutter();
    _box = await Hive.openBox("data");
  }

  Box get getBox {
    if (_box == null) {
      throw Error();
    }

    return _box!;
  }
}
