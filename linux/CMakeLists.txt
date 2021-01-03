cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "web_gpu")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "web_gpu_plugin")
set(LIB_NAME "web_gpu_init")

add_library(${PLUGIN_NAME} SHARED
  "web_gpu_plugin.cc"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)
target_link_libraries(${PLUGIN_NAME} PRIVATE ${LIB_NAME})

set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib/${CMAKE_SYSTEM_PROCESSOR}")

add_library(${LIB_NAME} SHARED
  "web_gpu_init.cc"
)
target_include_directories(${LIB_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}/../third_party")
target_link_directories(${LIB_NAME} PRIVATE ${LIB_DIR})
target_link_libraries(${LIB_NAME} PRIVATE dawn_proc dawn_native)

# List of absolute paths to libraries that should be bundled with the plugin
set(web_gpu_bundled_libraries
  "$<TARGET_FILE:${LIB_NAME}>"
  "${LIB_DIR}/libdawn_proc.so"
  "${LIB_DIR}/libdawn_native.so"
  PARENT_SCOPE
)
