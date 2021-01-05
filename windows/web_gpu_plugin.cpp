#include "include/web_gpu/web_gpu_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>

namespace {

class WebGpuPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WebGpuPlugin();

  virtual ~WebGpuPlugin();

};

// static
void WebGpuPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {

  auto plugin = std::make_unique<WebGpuPlugin>();

  registrar->AddPlugin(std::move(plugin));
}

WebGpuPlugin::WebGpuPlugin() {}

WebGpuPlugin::~WebGpuPlugin() {}


}  // namespace

void WebGpuPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  WebGpuPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
