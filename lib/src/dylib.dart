import 'dart:ffi' as ffi;
import 'dart:io';

import 'bindings.dart';

LibWebGPU _dylib;
LibWebGPU get dylib => _dylib ??= LibWebGPU(
    ffi.DynamicLibrary.open(_resolveLibPath('dawn_proc', 'LIBDAWN_PATH')));

extension _StringWith on String {
  String prefixWith(String prefix) {
    if (isEmpty || startsWith(prefix)) return this;
    return prefix + this;
  }

  String suffixWith(String suffix) {
    if (isEmpty || endsWith(suffix)) return this;
    return this + suffix;
  }
}

String get _libPrefix => Platform.isWindows ? '' : 'lib';

String get _libSuffix {
  return Platform.isWindows
      ? '.dll'
      : Platform.isMacOS || Platform.isIOS
          ? '.dylib'
          : '.so';
}

String _fixupLibName(String libName) {
  return libName.prefixWith(_libPrefix).suffixWith(_libSuffix);
}

String _fixupLibPath(String libPath) => libPath.suffixWith('/');

bool _isFilePath(String path) {
  return path.isNotEmpty &&
      Directory(path).statSync().type == FileSystemEntityType.file;
}

String _resolveLibPath(String baseName, String environmentVariable) {
  // allow specifying path to libdawn_proc.so via LIBDAWN_PATH Dart define or
  // environment variable
  final path = String.fromEnvironment(
    environmentVariable,
    defaultValue: Platform.environment[environmentVariable] ?? '',
  );

  // LIBDAWN_PATH=/path/to/libdawn_proc.so (full file path specified)
  if (_isFilePath(path)) return path;

  // LIBDAWN_PATH=/path (just the path specified)
  return _fixupLibPath(path) + _fixupLibName(baseName);
}
