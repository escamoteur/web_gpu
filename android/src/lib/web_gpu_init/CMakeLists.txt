cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "web_gpu_init")
project(${PROJECT_NAME} LANGUAGES CXX)

add_library(${PROJECT_NAME} SHARED
  "web_gpu_init.cpp"
)

target_include_directories(${PROJECT_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}/../../../../third_party")

set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../main/jniLibs/${CMAKE_ANDROID_ARCH_ABI}")

target_link_libraries(${PROJECT_NAME} PRIVATE
  "${LIB_DIR}/libdawn_proc.so"
  "${LIB_DIR}/libdawn_native.so"
)
