//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <web_gpu/web_gpu_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) web_gpu_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WebGpuPlugin");
  web_gpu_plugin_register_with_registrar(web_gpu_registrar);
}
