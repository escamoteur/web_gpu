cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "web_gpu")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "web_gpu_plugin")
set(LIB_NAME "web_gpu_init")

add_library(${PLUGIN_NAME} SHARED
  "web_gpu_plugin.cpp"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)
target_link_libraries(${PLUGIN_NAME} PRIVATE ${LIB_NAME})

set(BIN_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bin/${MSVC_CXX_ARCHITECTURE_ID}")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib/${MSVC_CXX_ARCHITECTURE_ID}")

add_library(${LIB_NAME} SHARED
  "web_gpu_init.cpp"
)
target_include_directories(${LIB_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}/../third_party")
target_link_directories(${LIB_NAME} PRIVATE ${LIB_DIR})
target_link_libraries(${LIB_NAME} PRIVATE dawn_proc.dll.lib dawn_native.dll.lib )

# List of absolute paths to libraries that should be bundled with the plugin
set(web_gpu_bundled_libraries
  "$<TARGET_FILE:${LIB_NAME}>"
  "${BIN_DIR}/dawn_proc.dll"
  "${BIN_DIR}/dawn_native.dll"
  PARENT_SCOPE
)
