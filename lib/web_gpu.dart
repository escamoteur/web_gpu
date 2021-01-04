import 'dart:async';

import 'package:flutter/services.dart';

import 'src/init.dart';

class WebGpu {
  static const MethodChannel _channel = const MethodChannel('web_gpu');
  static bool _initialized = false;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void ensureInitialized() {
    if (_initialized) return;
    _initialized = initWebGpu();
  }
}
