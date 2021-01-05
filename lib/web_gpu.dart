import 'package:web_gpu/src/dylib.dart';

import 'src/bindings.dart';
import 'src/init.dart';

class WebGpu {
  static bool _initialized = false;

  static void ensureInitialized() {
    if (_initialized) return;
    _initialized = initWebGpu();
  }

  static LibWebGPU get lib => dylib;
}
