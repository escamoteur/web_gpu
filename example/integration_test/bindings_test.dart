import 'dart:ffi' as ffi;

import 'package:flutter_test/flutter_test.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:integration_test/integration_test.dart';
import 'package:web_gpu/src/dylib.dart';
import 'package:web_gpu/web_gpu.dart';

void main() => run(_testMain);

void _testMain() async {
  WebGpu.ensureInitialized();

  test('wgpuCreateInstance', () {
    final instance = dylib.wgpuCreateInstance(ffi.nullptr);
    expect(instance, isNotNull);
    expect(instance.address, isNonZero);
    ffi.free(instance);
  });
}
