#import "WebGpuPlugin.h"
#if __has_include(<web_gpu/web_gpu-Swift.h>)
#import <web_gpu/web_gpu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "web_gpu-Swift.h"
#endif

@implementation WebGpuPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWebGpuPlugin registerWithRegistrar:registrar];
}
@end
