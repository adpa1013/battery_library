
import 'dart:async';

import 'package:flutter/services.dart';

class OkbatterieLibrary {
  static const MethodChannel _channel =
      const MethodChannel('okbatterie_library');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
