import 'src/init.dart';

class WebGpu {
  static bool _initialized = false;

  static void ensureInitialized() {
    if (_initialized) return;
    _initialized = initWebGpu();
  }
}
